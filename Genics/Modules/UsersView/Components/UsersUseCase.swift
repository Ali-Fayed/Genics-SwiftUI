//
//  UsersUseCase.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation
protocol UsersViewUseCaseLogic {
    func fetchUsers(requestValues: UsersListRequestValue) async throws -> ([User])
    func fetchTopUsers() async throws -> ([User])
}
final class UsersViewUseCase: UsersViewUseCaseLogic {
    func fetchTopUsers() async throws -> ([User]) {
        let users: [User] = try await withCheckedThrowingContinuation({ continuation in
            let networkRequestValues = NetworkRequestValues(dataModel: [User].self, requestData: RequestRouter.gitUsersList(1))
            NetworkManger.shared.performRequest(requestValues: networkRequestValues) { result in
                switch result {
                case .success(let users):
                    continuation.resume(returning: users)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
        return users
    }
    func fetchUsers(requestValues: UsersListRequestValue) async throws -> ([User]) {
        let users: [User] = try await withCheckedThrowingContinuation({ continuation in
            let networkRequestValues = NetworkRequestValues(dataModel: UsersEntity.self, requestData: RequestRouter.gitSearchUsers(requestValues.page, requestValues.searchText))
            NetworkManger.shared.performRequest(requestValues: networkRequestValues) { result in
                switch result {
                case .success(let users):
                    continuation.resume(returning: users.items)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
        return users
    }
}
