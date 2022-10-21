//
//  ReposDataSource.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation
enum ReposListType {
    case userOwnedRpos
    case publicRepos
    case userStarredRepos
}
class ReposViewDataSource: ObservableObject {
    @Published var reposList: [Repository] = []
    @Published var starredReposList: [Repository] = []
    @Published var userReposList: [Repository] = []
    @Published var apiError: Error?
    @Published var isShowingAlert = false
    func reposModel(reposViewType: ReposListType) -> [Repository] {
        if reposViewType == .publicRepos {
            return reposList
        } else if reposViewType == .userStarredRepos {
            return starredReposList
        } else if reposViewType == .userOwnedRpos {
            return userReposList
        } else {
            return []
        }
    }
}
