//
//  CardMovie.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardMovie: View {
  private var movie: Search
  
  init(movie: Search) {
    self.movie = movie
  }
  
  var body: some View {
    ZStack {
      HStack {
        AsyncImage(url: URL(string: movie.poster ?? "")) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
        } placeholder: {
          Color.neutral.n2
        }
        .opacity(0.5)
        .background(Color.black)
      }
      .frame(height: 200)
      .frame(maxWidth: .infinity, alignment: .center)
      .shadow(color: Color.shadows.image, radius: 8, x: 8, y: 3)
      .clipShape(.rect(cornerRadius: 10) , style: .init())
      .padding([.leading, .trailing], 20)
      
      Text(movie.title ?? "")
        .foregroundStyle(Color.white)
    }
  }
}
