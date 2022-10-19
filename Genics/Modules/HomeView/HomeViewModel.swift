//
//  HomeViewModel.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    var homeData: [HomeDataModel] = [.init(id: 0, title: "Users", image: "Profile"), .init(id: 1, title: "Repositories", image: "Repositories"), .init(id: 2, title: "Issues", image: "Issues"), .init(id: 3, title: "Starred", image: "Startted"), .init(id: 4, title: Titles.organizationsViewTitle, image: "Organizations")]
    var searchNavigatorData: [HomeDataModel] = [.init(id: 0, title: "Users with ", image: "peoples"), .init(id: 1, title: "Repositories with ", image: "repoSearch"), .init(id: 2, title: "Issues with ", image: "issue")]
    var searchHistory = ["ss", "sss"]
}
