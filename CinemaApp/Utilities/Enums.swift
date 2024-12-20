//
//  Enums.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 18/12/24.
//
import Foundation

enum Endpoint {
  case search(query: String, page: Int)
  case details
}

enum HTTPMETHOD: String {
    case GET = "get"
    case POST = "post"
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

enum SearchType {
  case notFound
  case firsState
}

enum SearchMessage: String {
  case title = "Still no searches?"
  case subtitle = "At least 3 characters are required for your search"
  case noFoundMessage = "Sorry, we couldn't find what you were looking for."
}

enum FocusedField {
  case search
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}