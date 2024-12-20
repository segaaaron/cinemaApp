//
//  Emptystate.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//
import SwiftUI

struct Emptystate: View {
  private let EmptpyStateType: SearchType
  
  init(EmptpyStateType: SearchType) {
    self.EmptpyStateType = EmptpyStateType
  }

  var TextTitle: String {
    switch EmptpyStateType {
    case .notFound:
      return SearchMessage.noFoundMessage.rawValue
    case .firsState:
      return SearchMessage.title.rawValue
    }
  }
  
  var EmptyIcon: String {
    switch EmptpyStateType {
    case .notFound:
      return "NotMovieFound"
    case .firsState:
      return "searchCinema"
    }
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Image(EmptyIcon, bundle: .main)
        .resizable()
        .frame(width: 60, height: 60)
        .padding(.top, 10)
      VStack(alignment: .center, spacing: 10) {
        Text(TextTitle)
          .font(Font.system(size: 16))
          .fontWeight(.bold)
          .foregroundStyle(Color.neutral.n2)
        Text(SearchMessage.subtitle.rawValue)
          .font(Font.system(size: 14))
          .fontWeight(.semibold)
          .foregroundStyle(Color.grey.c2)
          .isHidden(EmptpyStateType != .firsState)
      }
      .padding([.leading, .trailing], 14)
      .multilineTextAlignment(.center)
    }
    .frame(height: 350)
    .frame(maxWidth: .infinity, alignment: .center)
    .background(Color.grey.c1)
    .clipShape(.rect(cornerRadius: 10) , style: .init())
    .padding([.leading, .trailing], 20)
  }
}
