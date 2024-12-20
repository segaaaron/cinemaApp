//
//  CardMovie.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI
import Kingfisher

struct CardMovie: View {
  private var movie: Search
  
  init(movie: Search) {
    self.movie = movie
  }
  
  var poster: String {
    movie.poster ?? ""
  }
  
  var body: some View {
    ZStack {
      Image("cardBackground")
        .resizable()
        .clipped()
      HStack(spacing: 15){
        KFImage(URL(string: poster))
          .resizable()
          .clipped()
          .cornerRadius(15)
          .frame(width: 100, height: 150)
          .isHidden(poster.contains("N/A"))
          .padding(.leading, 25)
        Image("NotMovieFound")
          .resizable()
          .clipped()
          .frame(width: 100, height: 150)
          .padding(.leading, 25)
          .cornerRadius(15)
          .isHidden(!poster.contains("N/A"))
        VStack(alignment: .leading){
          Text(movie.title ?? "")
            .font(.headline)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Color.white)
          Text(movie.year ?? "")
            .fontWeight(.light)
            .font(.footnote)
            .foregroundStyle(Color.white)
          HStack {
            Text(movie.type?.rawValue ?? "")
              .font(.callout)
              .fontWeight(.bold)
              .foregroundStyle(Color.white)
          }
          .frame(width: 70, height: 35)
          .background(Color.customBlue.b3)
          .cornerRadius(15)
          .padding(.top, 10)
        }
        .padding(.trailing, 15)
        Spacer()
      }
    }
    .frame(height: 200)
    .padding([.leading, .trailing], 25)
  }
}
