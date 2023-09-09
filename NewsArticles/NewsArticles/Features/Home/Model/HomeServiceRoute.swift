//
//  HomeServiceRoute.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

enum HomeServiceRoute: ApiRoute {
    
    case topNews
    
    var method: ApiMethod {
        switch self {
        case .topNews:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .topNews:
            return "/v2/everything"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .topNews:
            return nil
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .topNews:
            return nil
        }
    }
    
    var queryParams: [String : String]? {
        switch self {
        case .topNews:
            return ["q": "tesla"]
        }
    }
}
