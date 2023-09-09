//
//  ApiRequest.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

public protocol ApiRoute {
    
    var method: ApiMethod { get }
    
    var path: String { get }
    
    var headers: [String: String]? { get }
    
    var parameters: [String: Any]? { get }
    
    var queryParams: [String: String]? { get }
    
}



public enum ApiMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
