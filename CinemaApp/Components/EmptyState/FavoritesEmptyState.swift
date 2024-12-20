//
//  FavoritesEmptyState.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI

struct FavoritesEmptyState: View {
  var body: some View {
    VStack(spacing: 20) {
      Image("favorites", bundle: .main)
        .resizable()
        .frame(width: 120, height: 120)
        .padding(.top, 10)
      Text("Select a movie to save it in this section")
        .font(Font.system(size: 16))
        .fontWeight(.bold)
        .foregroundStyle(Color.neutral.n2)
        .padding([.leading, .trailing], 10)
        .multilineTextAlignment(.center)
    }
    .frame(height: 450)
    .frame(maxWidth: .infinity, alignment: .center)
    .clipShape(.rect(cornerRadius: 10) , style: .init())
    .padding([.leading, .trailing], 20)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color.customBlue.b2, lineWidth: 1)
    )
    .padding([.leading, .trailing], 35)
  }
}
