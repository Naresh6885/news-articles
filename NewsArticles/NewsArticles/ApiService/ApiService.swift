//
//  ApiService.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

final class ApiService {
    
    public static var shared = ApiService()
    
    /// The shared session
    private var session: URLSession
    
    /// Configuration
    private var configuration: URLSessionConfiguration
    
    /// After one minute the api will return timeout error
    private var timeout: TimeInterval = 60
    
    /// Base url for the applications
    private let baseUrl = "https://newsapi.org"
    
    /// Api key
    private let apiKey = "950676f200be4260b8f92f8f1e73c499"
    
    /// This will make this class as the singlton
    private init() {
        
        configuration = URLSessionConfiguration.default //background(withIdentifier: "com.study.arctest.NewsArticles.ApiService")
        
        configuration.timeoutIntervalForRequest = timeout
        
        session = URLSession.init(configuration: configuration)
        
    }
    
    func dataTask<T: Codable>(route: ApiRoute, responseType: T.Type) async throws -> T {
        
        let urlRequest: URLRequest = try self.buildRequest(route: route)
        
        let (data, response) = try await session.data(for: urlRequest)
                
        print("Response data - ", data)
        
        print("Response - ", (response as? HTTPURLResponse)?.statusCode ?? 0)
                
        if !data.isEmpty {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            throw ApiError.parsingError
        }
    }
    
        
    private func buildRequest(route: ApiRoute) throws -> URLRequest {
        
        guard let url = URL(string: (baseUrl + route.path)) else {
            throw ApiError.invalidRequest
        }
        
        var urlRequest = URLRequest.init(url: url)
        
        urlRequest.httpMethod = route.method.rawValue
        
        urlRequest.allHTTPHeaderFields = route.headers
        
        if let params = route.parameters {
            do {
                let data = try JSONSerialization.data(withJSONObject: params)
                urlRequest.httpBody = data
            } catch {
                throw error
            }
        }
        
        if let queryParams = route.queryParams {
            
            /// Adding the default parameters
            var items: [URLQueryItem] = [URLQueryItem.init(name: "apiKey", value: self.apiKey)]
            
            for key in queryParams.keys {
                let item = URLQueryItem.init(name: key, value: queryParams[key])
                items.append(item)
            }
            
            urlRequest.url?.append(queryItems: items)
        }
        
        return urlRequest
    }
}

