//
//  UsersUseCase.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation
protocol UsersViewUseCaseLogic {
    func fetchUsers(usersListRequestValue: UsersListRequestValue) async throws -> ([User])
    func fetchTopUsers() async throws -> ([User])
}
final class UsersViewUseCase: UsersViewUseCaseLogic {
    func fetchTopUsers() async throws -> ([User]) {
        let requestValues = NetworkRequestValues(dataModel: [User].self, requestData: RequestRouter.gitUsersList(1))
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese
    }
    func fetchUsers(usersListRequestValue: UsersListRequestValue) async throws -> ([User]){
        let requestValues = NetworkRequestValues(dataModel: UsersEntity.self, requestData: RequestRouter.gitSearchUsers(usersListRequestValue.page, usersListRequestValue.searchText))
        let responese = try await NetworkManger.shared.performRequestt(requestValues: requestValues)
        return responese.items
    }
}
