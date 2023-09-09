//
//  TabItemColor.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

@frozen enum TabItems: CaseIterable {
    
    case home
    case todaysNews
    case markets
      
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .markets:
            return "Markets"
        case .todaysNews:
            return "Today's News"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "tab.item.home"
        case .markets:
            return "tab.item.market"
        case .todaysNews:
            return "tab.item.todays.news"
        }
    }
    
    var selectedColorCode: String {
        return "#176B87"
    }
    
    var unselectedColorCode: String {
        return "#D8D9DA"
    }
    
    
}
