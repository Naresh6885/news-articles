//
//  StoryText.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

private enum StoryTextColor: AppColorProvider {
    
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

struct StoryText: View {
    var text: String
    @Environment(\.colorScheme) private var currentScheme
        
    var body: some View {
        Text(text)
            .font(.custom(AppFont.AmericanTypewriter.rawValue, size: 14))
            .foregroundColor(self.textColor())
    }
    
    private func textColor() -> Color {
        currentScheme == .light ? .init(hex: StoryTextColor.textColor.lightMode) : .init(hex: StoryTextColor.textColor.darkMode)
    }
}

struct StoryText_Previews: PreviewProvider {
    static var previews: some View {
        StoryText(text: "Description")
    }
}
