//
//  FavoritesViewModel.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 20/12/24.
//

import SwiftUI
import CoreData

final class FavoritesViewModel: ObservableObject {
  @Published var favoritesMovies: [Search] = []
  
  func loadStorage() {
    var store = StoreData()
    store.read()
    favoritesMovies = store.storeList
  }
}
