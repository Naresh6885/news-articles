//
//  AuthorText.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

private enum AuthorTextColor: AppColorProvider {
    
    case textColor
    
    /// Specify the color which needs to be render for the light mode of the app, i.e white background
    var lightMode: String {
        return "#96B6C5"
    }
    
    /// Specify the color which needs to be render for the dark mode of the app, i.e black background
    var darkMode: String {
        return "#F1F0E8"
    }
}

struct AuthorText: View {
    var text: String
    @Environment(\.colorScheme) private var currentScheme
        
    var body: some View {
        Text(text)
            .font(.custom(AppFont.AmericanTypewriterSemibold.rawValue, size: 10))
            .foregroundColor(self.textColor())
            .lineLimit(2)
    }
    
    private func textColor() -> Color {
        currentScheme == .light ? .init(hex: AuthorTextColor.textColor.lightMode) : .init(hex: AuthorTextColor.textColor.darkMode)
    }
}

struct AuthorText_Previews: PreviewProvider {
    static var previews: some View {
        AuthorText(text: "Description")
    }
}

