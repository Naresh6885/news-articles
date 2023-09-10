//
//  NewsTabView.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

struct NewsTabView: View {
    
    var body: some View {
        TabView {
            HomeView().environmentObject(HomeViewStore())
                .tabItem {
                    Label(TabItems.home.title, image: TabItems.home.icon)
                }
            TodaysNewsTabItem()
                .tabItem {
                    Label(TabItems.todaysNews.title, image: TabItems.todaysNews.icon)
                }

            MarketTabItem()
                .tabItem {
                    Label(TabItems.markets.title, image: TabItems.markets.icon)
                }
        }
        .tint(Color.init("tab.item.selected"))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView.init()
    }
}
