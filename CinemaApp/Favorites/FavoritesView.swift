//
//  FavoritesView.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 20/12/24.
//

import SwiftUI

struct FavoritesView: View {
 @ObservedObject var viewModel = FavoritesViewModel()
  
  var body: some View {
    NavigationView {
      switch viewModel.favoritesMovies.isEmpty {
      case true:
        FavoritesEmptyState()
          .padding(.top, 20)
      case false:
        ScrollView(showsIndicators: false) {
          LazyVStack {
            ForEach(viewModel.favoritesMovies, id: \.self) { item in
              NavigationLink {
                DetailView(movieId: item.imdbID ?? "")
              } label: {
                CardMovie(movie: item)
              }
            }
          }
        }
      }
    }
  }
}
