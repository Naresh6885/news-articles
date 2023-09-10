//
//  HomeViewListItem.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

private enum HomeViewListItemColor: AppColorProvider {
    
    case deviderColor
    
    /// Specify the color which needs to be render for the light mode of the app, i.e white background
    var lightMode: String {
        return "#96B6C5"
    }
    
    /// Specify the color which needs to be render for the dark mode of the app, i.e black background
    var darkMode: String {
        return "#F1F0E8"
    }
}


struct HomeViewListItem: View {
    @Environment(\.colorScheme) private var currentScheme
    var article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HeadlineText(text: article.title ?? "")
            StoryText(text: article.story)
            HStack {
                Spacer()
                AuthorText(text: article.authorNameAndDate)
            }
            Divider()
                .background(self.deviderColor())
        }
        .padding(10)
        .listRowSeparator(.hidden)
    }
    
    private func deviderColor() -> Color {
        
        return currentScheme == .dark ? Color.init(hex: HomeViewListItemColor.deviderColor.darkMode) : Color.init(hex: HomeViewListItemColor.deviderColor.lightMode)
    }
}

//struct HomeViewListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewListItem()
//    }
//}
