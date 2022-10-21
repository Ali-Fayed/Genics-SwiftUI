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
                let usersList = try await useCase.fetchUsers(usersListRequestValue: requestValues)
                let topUsersList = try await useCase.fetchTopUsers()
                let response = UsersModel.LoadUsersList.UsersListResponse(usersListData: usersList, topUsersData: topUsersList)
                self.presenter?.presentUsersListData(response: response)
            } catch let error {
                let error = UsersModel.LoadUsersList.ApiError(error: error)
                self.presenter?.presentUsersListError(response: error)
            }
        }
    }
}
