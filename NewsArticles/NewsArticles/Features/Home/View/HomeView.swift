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
            Text("Loading....")
                .onAppear() {
                    
                }
        case .renderData(let articleList):
            
            List {
                HomeViewListItem()
                HomeViewListItem()
                HomeViewListItem()
                HomeViewListItem()
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
