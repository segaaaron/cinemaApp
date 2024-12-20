//
//  StoreData.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 20/12/24.
//
import SwiftUI

struct StoreData {
  var storeList: [Search] = []
  var store = UserDefaults.standard
  
  mutating func save(data: Search) {
    self.storeList.append(data)
    do {
      
      let encodedData = try JSONEncoder().encode(storeList)
      store.set(encodedData, forKey: "movieFavorites")
      
    } catch {
      debugPrint(error.localizedDescription)
    }
  }
  
  func deleteById(movieId: String) {
    let deleteItem = storeList.filter({ $0.imdbID == movieId })
    store.set(deleteItem, forKey: "movieFavorites")
  }
  
  mutating func read() {
    if let savedData = store.object(forKey: "movieFavorites") as? Data {
      do {
        let savedContacts = try JSONDecoder().decode([Search].self, from: savedData)
        storeList = savedContacts
        
      } catch {
        debugPrint(error.localizedDescription)
      }
    }
  }
}
