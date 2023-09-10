//
//  NewsArticlesApp.swift
//  NewsArticles
//
//  Created by Naresh on 08/09/23.
//

import SwiftUI

@main
struct NewsArticlesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(HomeViewStore())
        }
    }
}
