//
//  HomeViewModel.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    var homeData: [HomeDataModel] = [.init(id: 0, title: "Users", image: "Profile"), .init(id: 1, title: "Repositories", image: "Repositories"), .init(id: 2, title: "Issues", image: "Issues"), .init(id: 3, title: Titles.organizationsViewTitle, image: "Organizations")]
}
