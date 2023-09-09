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
            HeadlineText(text: "Abc")
                .onAppear() {
                    Task {
                        do {
                            let data = try await ApiService.shared.dataTask(route: HomeServiceRoute.topNews, responseType: ArticleList.self)
                            print(data)
                        } catch {
                            print(error)
                        }
                    }
            }
        }
    }
}
