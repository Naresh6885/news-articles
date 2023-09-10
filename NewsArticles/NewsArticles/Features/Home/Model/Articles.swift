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
    
    let uuid = UUID()

    var author: String?
    
    var title: String?
    
    var description: String?
    
    var url: String?
    
    var urlToImage: String?
        
    var publishedAt: String?
    
    var content: String?
 
    
    var story: String {
        var desc = self.description ?? ""
        let cont = self.content ?? ""
        if !desc.isEmpty && !cont.isEmpty {
            desc += "\n\(cont)"
        }
        return desc
    }
    
    var authorNameAndDate: String {
        var authorName = self.author ?? ""
        let dateString = self.publishedAt ?? ""
        if !authorName.isEmpty && !dateString.isEmpty {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            guard let date = formatter.date(from: dateString) else { return authorName }
            formatter.dateFormat = "MMM d, yyyy"
            let dateStr = formatter.string(from: date)
            authorName += ", \(dateStr)"
        }
        return authorName
    }
}
