//
//  HomeViewModel.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

final class HomeViewStore: ObservableObject, Pagination {
    
    var page: Int = 1
    
    var pageSize: Int = 100
    
    @Published var viewState: ViewState<ArticleList>
    
    private var articles: [Article]
        
    init() {
        viewState = .loading
        articles = []
    }
    
    func fetchData() {
        Task {
            self.set(state: .loading)
            do {
                self.set(state: .loading)
                var data = try await ApiService.shared.dataTask(route: HomeServiceRoute.topNews(self), responseType: ArticleList.self)
                if page == 1 {
                    articles = data.articles ?? []
                    self.set(state: .renderData(data))
                } else {
                    data.articles = (articles + (data.articles ?? []))
                    self.set(state: .renderData(data))
                }
            } catch {
                self.set(state: .showError(error.localizedDescription))
            }
        }
    }
    
    public func dataDidApear(for article: Article) {
        if case let .renderData(articleList) = viewState {
            guard let last = articleList.articles?.last else {
                print("No data found")
                return
            }
            if last.uuid == article.uuid {
                /// Last item appeared, so hit another api to get new data
                page += 1
                self.fetchData()
            }
        }
    }
    
    private func set(state: ViewState<ArticleList>) {
        DispatchQueue.main.async { [weak self] in
            self?.viewState = state
        }
    }
}
