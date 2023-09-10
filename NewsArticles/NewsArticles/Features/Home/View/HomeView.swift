//
//  HomeView.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var store: HomeViewStore
    
    var body: some View {
        
        switch(store.viewState) {
        case .loading:
            ZStack {
                ProgressView()
                    .onAppear() {
                        store.fetchData()
                    }
            }
        case .renderData(let articleList):
            let list = articleList.articles ?? []
            List(list, id: \.uuid) { article in
                HomeViewListItem(article: article)
                    .onAppear() {
                        self.store.dataDidApear(for: article)
                    }
            }
            .listStyle(.plain)
        case .showError(let message):
            Text(message).foregroundColor(.red)
        case .showPopupMessage(let message):
            Text(message).foregroundColor(.red)
        }
    }
}

struct HomeTabItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewStore())
    }
}
