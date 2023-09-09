//
//  HomeViewModel.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

final class HomeViewStore: ObservableObject {
            
    @Published var viewState: ViewState<ArticleList>
        
    init() {
        viewState = .loading
    }
    
    func fetchData() async {
        
        viewState = .loading
        
        do {
            self.viewState = .loading
            let data = try await ApiService.shared.dataTask(route: HomeServiceRoute.topNews, responseType: ArticleList.self)
            viewState = .renderData(data)
        } catch {
            self.viewState = .showError(error.localizedDescription)
        }
    }
}
