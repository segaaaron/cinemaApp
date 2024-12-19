//
//  MovieModel.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 18/12/24.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
  let search: [Search]?
  let totalResults, response: String?
  
  enum CodingKeys: String, CodingKey {
    case search = "Search"
    case totalResults
    case response = "Response"
  }
  
  init(search: [Search]? = [], totalResults: String? = nil, response: String? = nil) {
    self.search = search
    self.totalResults = totalResults
    self.response = response
  }
}

// MARK: - Search
struct Search: Codable, Hashable {
  let title, year, imdbID: String?
  let type: TypeEnum?
  let poster: String?
  
  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbID
    case type = "Type"
    case poster = "Poster"
  }
}

enum TypeEnum: String, Codable {
  case movie = "movie"
  case series = "series"
}
