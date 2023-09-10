//
//  ViewModel.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

public protocol Store {
            
}

/// This protocol must be abp
protocol Pagination {
    var page: Int { set get }
    var pageSize: Int { set get }
}
