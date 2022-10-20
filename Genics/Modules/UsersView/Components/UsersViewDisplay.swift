//
//  UsersViewDisplay.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation
import SwiftUI

protocol UsersViewDisplayLogic {
  func displayUsersList(viewModel: UsersModel.LoadUsersList.ViewModel)
  func displayError(error: UsersModel.LoadUsersList.ApiError, isShowingAlert: Bool)
}
extension UsersView: UsersViewDisplayLogic {
    func displayError(error: UsersModel.LoadUsersList.ApiError, isShowingAlert: Bool) {
        DispatchQueue.main.async {
            dataSource.apiError = error.error
            dataSource.isShowingAlert = isShowingAlert
        }
    }
    func displayUsersList(viewModel: UsersModel.LoadUsersList.ViewModel) {
        DispatchQueue.main.async {
            dataSource.usersList = viewModel.usersListData
        }
    }
    func fetchUsersList(usersListRequestValue: UsersListRequestValue = UsersListRequestValue(page: 1, searchText: "mm")) {
        let request = UsersModel.LoadUsersList.Request()
        interactor?.loadUsersList(request: request, requestValues: usersListRequestValue)
    }
}
