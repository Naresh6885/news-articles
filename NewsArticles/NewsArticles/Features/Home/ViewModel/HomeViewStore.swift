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
    
    func fetchData() {
        Task {
            self.set(state: .loading)
            do {
                self.set(state: .loading)
                let data = try await ApiService.shared.dataTask(route: HomeServiceRoute.topNews, responseType: ArticleList.self)
                self.set(state: .renderData(data))
            } catch {
                self.set(state: .showError(error.localizedDescription))
            }
        }
    }
    
    private func set(state: ViewState<ArticleList>) {
        DispatchQueue.main.async { [weak self] in
            self?.viewState = state
        }
    }
}
