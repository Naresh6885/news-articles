//
//  SwiftUIView.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import SwiftUI

private enum HeadlineTextColor: AppColorProvider {
    
    case textColor
    
    /// Specify the color which needs to be render for the light mode of the app, i.e white background
    var lightMode: String {
        return "#0F2C59"
    }

    /// Specify the color which needs to be render for the dark mode of the app, i.e black background
    var darkMode: String {
        return "#DAC0A3"
    }
}

struct HeadlineText: View {
    var text: String
    @Environment(\.colorScheme) private var currentScheme
        
    var body: some View {
        Text(text)
            .font(.custom(AppFont.AmericanTypewriterBold.rawValue, size: 24))
            .foregroundColor(self.textColor())
            .lineLimit(3)
    }
    
    private func textColor() -> Color {
        currentScheme == .light ? .init(hex: HeadlineTextColor.textColor.lightMode) : .init(hex: HeadlineTextColor.textColor.darkMode)
    }
}

struct HeadlineText_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineText(text: "Hello")
    }
}
