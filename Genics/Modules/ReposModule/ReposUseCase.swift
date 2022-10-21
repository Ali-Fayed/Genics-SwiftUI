//
//  ReposUseCase.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation
protocol ReposViewUseCaseLogic {
    func fetchRepos(usersListRequestValue: UsersListRequestValue) async throws -> ([Repository])
    func fetchStarred() async throws -> ([Repository])
    func fetchUserRepos() async throws -> ([Repository])
}
final class ReposViewUseCase: ReposViewUseCaseLogic {
    func fetchRepos(usersListRequestValue: UsersListRequestValue) async throws -> ([Repository]){
        let requestValues = NetworkRequestValues(dataModel: Repositories.self, requestData: RequestRouter.gitPublicRepositories(usersListRequestValue.page, usersListRequestValue.searchText))
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese.items
    }
    func fetchStarred() async throws -> ([Repository]) {
        let requestValues = NetworkRequestValues(dataModel: [Repository].self, requestData: RequestRouter.gitAuthenticatedUserStarred)
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese
    }
    func fetchUserRepos() async throws -> ([Repository]) {
        let requestValues = NetworkRequestValues(dataModel: [Repository].self, requestData: RequestRouter.gitAuthenticatedUserRepositories)
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese
    }
}
