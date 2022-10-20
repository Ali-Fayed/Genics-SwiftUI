//
//  UsersUseCase.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation
protocol HomeViewUseCase {
    func fetchUsers(requestValues: UsersListRequestValue) async throws -> ([User])
}
final class HomeUseCase: HomeViewUseCase {
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
