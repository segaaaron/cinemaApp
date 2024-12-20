//
//  MainTabbarView.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 20/12/24.
//

import SwiftUI

struct MainTabbarView: View {
  @State var selectedTab = 0
  
  var body: some View {
    ZStack(alignment: .bottom){
      TabView(selection: $selectedTab) {
        SearchMovieView()
          .tabItem {
            Label("Search", systemImage: "movieclapper")
          }
        
        FavoritesView()
          .tabItem {
            Label("Favorites", systemImage: "heart.text.clipboard")
          }
      }
      .background(Color.grey.c1)
    }
    .onAppear() {
      UITabBar.appearance().backgroundColor = .lightGray.withAlphaComponent(0.3)
    }
  }
}
