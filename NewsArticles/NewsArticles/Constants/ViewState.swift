//
//  ViewState.swift
//  NewsArticles
//
//  Created by Naresh on 09/09/23.
//

import Foundation

enum ViewState<T> {
    /// In this state the view will show the loading
    case loading
    /// Rending the data for the view, we need to parse the data
    case renderData(T)
    /// Showing the error
    case showError(String)
    /// Showing the message popup
    case showPopupMessage(String)
}
