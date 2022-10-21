//
//  ReposUseCase.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation
protocol ReposViewUseCaseLogic {
    func fetchRepos(usersListRequestValue: UsersListRequestValue) async throws -> ([Repository])
    func fetchTopRepos() async throws -> ([Repository])
}
final class ReposViewUseCase: ReposViewUseCaseLogic {
    func fetchTopRepos() async throws -> ([Repository]) {
        let requestValues = NetworkRequestValues(dataModel: Repositories.self, requestData: RequestRouter.gitPublicRepositories(1, "mm"))
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese.items
    }
    func fetchRepos(usersListRequestValue: UsersListRequestValue) async throws -> ([Repository]){
        let requestValues = NetworkRequestValues(dataModel: Repositories.self, requestData: RequestRouter.gitPublicRepositories(usersListRequestValue.page, usersListRequestValue.searchText))
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese.items
    }
}
