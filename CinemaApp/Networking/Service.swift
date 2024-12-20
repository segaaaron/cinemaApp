//
//  Service.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 18/12/24.
//

import Foundation
import Combine

final class Service {
  static let shared = Service()
  private let path = PathUrl()
  private var cancellables = Set<AnyCancellable>()
  
  private init() {}
  
  func fetchData<T: Decodable>(query: String = "", page: Int = 0, type: T.Type, endPoint: Endpoint = .search, movieId: String = "") -> Future<T, Error> {
    let request = Request()
    var params: [String: Any] = [:]

    switch endPoint {
    case .search:
      let searchParams: [String: Any]  = [
        "apikey": path.apikey,
        "s": query,
        "page": page
      ]
      params = searchParams
    case .details:
      let detailParams: [String: Any]  = [
        "apikey": path.apikey,
        "i": movieId,
        "plot": "full"
      ]
      params = detailParams
    }

    request.url = path.baseUrl
    request.params = params
    return Future<T, Error> { [weak self] promise in
      guard let self = self,
        let respRequest = ApiRequest.getRequest(with: request) else {
        return promise(.failure(NetworkError.invalidURL))
      }
                                                
      URLSession
        .shared
        .dataTaskPublisher(for: respRequest)
        .tryMap { (data, response) -> Data in
          guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.responseError
          }
          return data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { (completion) in
          if case let .failure(error) = completion {
            switch error {
            case let decodingError as DecodingError:
              promise(.failure(decodingError))
            case let apiError as NetworkError:
              promise(.failure(apiError))
            default:
              promise(.failure(NetworkError.unknown))
            }
          }
        }, receiveValue: { promise(.success($0)) })
        .store(in: &self.cancellables)
    }
  }
}
