//
//  HomeServiceRoute.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

enum HomeServiceRoute: ApiRoute {
    
    case topNews(Pagination)
    
    var method: ApiMethod {
        switch self {
        case .topNews(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .topNews(_):
            return "/v2/everything"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .topNews(_):
            return nil
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .topNews(_):
            return nil
        }
    }
    
    var queryParams: [String : String]? {
        switch self {
        case .topNews(let Pagination):
            return ["q": "tesla", "page":
                        "\(Pagination.page)", "pageSize": "\(Pagination.pageSize)"]
        }
    }
}
