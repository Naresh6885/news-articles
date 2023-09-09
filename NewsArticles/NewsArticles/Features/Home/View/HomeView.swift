//
//  HomeView.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            HomeViewListItem()
            HomeViewListItem()
            HomeViewListItem()
            HomeViewListItem()
        }
        .listStyle(.plain)
    }
}

struct HomeTabItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
