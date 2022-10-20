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
        viewDataSource.apiError = error.error
        viewDataSource.isShowingAlert = isShowingAlert
    }
    func displayUsersList(viewModel: UsersModel.LoadUsersList.ViewModel) {
        DispatchQueue.main.async { 
            viewDataSource.usersList = viewModel.usersListData
        }
    }
    func fetchUsersList() {
        let request = UsersModel.LoadUsersList.Request()
        interactor?.loadUsersList(request: request)
    }
}
