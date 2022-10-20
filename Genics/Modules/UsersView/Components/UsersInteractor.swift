//
//  UsersInteractor.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation

protocol UsersViewBusinessLogic {
    func loadUsersList(request: UsersModel.LoadUsersList.Request, requestValues: UsersListRequestValue)
}
class UsersViewInteractor: UsersViewBusinessLogic {
    var presenter: UsersViewPresentationLogic?
    var useCase: UsersViewUseCase
    init(useCase: UsersViewUseCase = UsersViewUseCase()) {
        self.useCase = useCase
    }
    func loadUsersList(request: UsersModel.LoadUsersList.Request, requestValues: UsersListRequestValue) {
        Task {
            do {
                let users = try await useCase.fetchUsers(requestValues: requestValues)
                let topUsers = try await useCase.fetchTopUsers()
                let response = UsersModel.LoadUsersList.UsersListResponse(usersListData: users, topUsersData: topUsers)
                self.presenter?.presentUsersListData(response: response)
            } catch {
                let error = UsersModel.LoadUsersList.ApiError(error: error)
                self.presenter?.presentUsersListError(response: error)
            }
        }
    }
}
