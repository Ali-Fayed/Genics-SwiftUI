//
//  UserPresenter.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation
import Foundation

protocol UsersViewPresentationLogic {
  func presentUsersListData(response: UsersModel.LoadUsersList.Response)
  func presentUsersListError(response: UsersModel.LoadUsersList.ApiError)
}

class UsersViewPresenter: UsersViewPresentationLogic {
  var view: UsersViewDisplayLogic?
    func presentUsersListError(response: UsersModel.LoadUsersList.ApiError) {
        let error = UsersModel.LoadUsersList.ApiError(error: response.error)
        view?.displayError(error: error, isShowingAlert: true)
    }
  func presentUsersListData(response: UsersModel.LoadUsersList.Response) {
    let viewModel = UsersModel.LoadUsersList.ViewModel(
        usersListData: response.usersListData
    )
    view?.displayUsersList(viewModel: viewModel)
  }
}
