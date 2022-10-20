//
//  UsersInteractor.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation

protocol UsersViewBusinessLogic {
  func loadUsersList(request: UsersModel.LoadUsersList.Request)
}
class UsersViewInteractor: UsersViewBusinessLogic {
  var presenter: UsersViewPresentationLogic?
  var useCase: HomeUseCase
  init(useCase: HomeUseCase = HomeUseCase()) {
        self.useCase = useCase
  }
  func loadUsersList(request: UsersModel.LoadUsersList.Request) {
      Task {
          do {
              let requestValues = UsersListRequestValue(page: 1, searchText: "mmm")
              let users = try await useCase.fetchUsers(requestValues: requestValues)
              let response = UsersModel.LoadUsersList.Response(usersListData: users)
              self.presenter?.presentUsersListData(response: response)
          } catch {
              let error = UsersModel.LoadUsersList.ApiError(error: error)
              self.presenter?.presentUsersListError(response: error)
          }
      }
    }
}
