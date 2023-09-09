//
//  NewsList.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

struct ArticleList: Codable {
    
    var status: String?
    
    var code: String?
    
    var message: String?
        
    var articles: [Article]?
}


struct Article: Codable {
    
    var author: String?
    
    var title: String?
    
    //var description: String?
    
    var url: String?
    
    var urlToImage: String?
        
    var publishedAt: String?
    
    var content: String?
    
}
