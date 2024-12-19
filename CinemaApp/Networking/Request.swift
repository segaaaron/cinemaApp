//
//  Request.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 18/12/24.
//
import Foundation

final class Request {
  var url: String
  var params: [String: Any]
  var method: HTTPMETHOD = .GET
  
  init(url: String = "", params: [String : Any] = [:], method: HTTPMETHOD = .GET) {
    self.url = url
    self.params = params
    self.method = method
  }
}

final class ApiRequest: NSObject {
  static func getRequest(with requestModel: Request) -> URLRequest? {
    let pathUrl = requestModel.url
    guard var component = URLComponents(string: pathUrl) else { return nil }
    let paramString: [String: String] = requestModel.params.compactMapValues { $0 as? String }
    
    if requestModel.method == .GET {
      component.queryItems = paramString.map {(key, value) in
        URLQueryItem(name: key, value: value)
      }
    }
    guard let currentUrl = component.url else { return nil }
    var request = URLRequest(url: currentUrl)
    
    request.httpMethod = requestModel.method.rawValue
    request.timeoutInterval = 30
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    return request
  }
}
