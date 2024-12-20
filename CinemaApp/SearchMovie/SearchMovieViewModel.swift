//
//  HomeMovieViewModel.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 18/12/24.
//

import Foundation
import SwiftUI
import Combine

final class SearchMovieViewModel: ObservableObject {
  private var cancellables = Set<AnyCancellable>()
  @Published var response = MovieResponse()
  
  func fetchSearchData(query: String) {
    Service.shared.fetchData(query: query, type: MovieResponse.self)
      .sink { completion in
        switch completion {
        case .failure(let err):
          print("Error is \(err.localizedDescription)")
        case .finished:
          debugPrint("Finished")
        }
      }
    receiveValue: { [weak self] response in
      self?.response = response
      print(response.response ?? "")
    }
    .store(in: &cancellables)
  }
  
  func clearData() {
    response = MovieResponse()
  }
}