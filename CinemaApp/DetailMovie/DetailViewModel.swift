//
//  DetailModelView.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 20/12/24.
//

import Foundation
import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
  private var cancellables = Set<AnyCancellable>()
  @Published var detailItem = DetailResponse()
  @Published var isLoading: Bool = true
  
  func fetchDetailData(movieId: String) {
    Service.shared.fetchData(type: DetailResponse.self, endPoint: .details, movieId: movieId)
      .sink { [weak self] completion in
        switch completion {
        case .failure(let err):
          debugPrint("Error is \(err.localizedDescription)")
          self?.isLoading = false
        case .finished:
          debugPrint("Finished")
          self?.isLoading = false
        }
      }
    receiveValue: { [weak self] response in
      self?.isLoading = false
      self?.detailItem = response
    }
    .store(in: &cancellables)
  }
}
