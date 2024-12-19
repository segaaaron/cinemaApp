//
//  HomeMovieView.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 18/12/24.
//

import Combine
import SwiftUI

struct SearchMovieView: View {
  @ObservedObject var viewModel = SearchMovieViewModel()
  @State var text: String = ""
  var body: some View {
    NavigationStack {
      SearchInput(text: $text) { value in
        if value.count > 2 {
          viewModel.fetchSearchData(query: value)
        }
      }
      ScrollView {
        LazyVStack {
          ForEach(viewModel.response.search ?? [], id: \.imdbID) { item in
            Text(item.title ?? "")
          }
        }
      }
    }
  }
}

#Preview {
  SearchMovieView()
}
