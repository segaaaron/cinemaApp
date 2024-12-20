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
    NavigationView {
      ScrollView(showsIndicators: false) {
        SearchInput(text: $text, placeholder: InputSeachText.placeholder.rawValue)
          .onChange(of: text) { _ , value in
            switch value {
            case let query where query.isEmpty:
              viewModel.clearData()
            case let query where query.count > 2:
              viewModel.fetchSearchData(query: value)
            default:
              break
            }
          }
        switch viewModel.response.response {
        case "False":
          Emptystate(EmptpyStateType: .notFound)
        case "True":
          LazyVStack {
            ForEach(viewModel.response.search ?? [], id: \.self) { item in
              CardMovie(movie: item)
            }
          }
        default:
          EmptyView()
        }
        Emptystate(EmptpyStateType: .firsState)
          .isHidden(!text.isEmpty)
      }
      .navigationTitle(NavigationTitleMessage.title.rawValue)
    }
  }
}

#Preview {
  SearchMovieView()
}
