//
//  ReposViewDisplay.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation
import SwiftUI

protocol ReposViewDisplayLogic {
  func displayReposList(viewModel: ReposModel.LoadReposList.ViewModel)
  func displayError(error: ReposModel.LoadReposList.ApiError, isShowingAlert: Bool)
}
extension ReposView: ReposViewDisplayLogic {
    func displayError(error: ReposModel.LoadReposList.ApiError, isShowingAlert: Bool) {
        DispatchQueue.main.async {
            dataSource.apiError = error.error
            dataSource.isShowingAlert = isShowingAlert
        }
    }
    func displayReposList(viewModel: ReposModel.LoadReposList.ViewModel) {
        DispatchQueue.main.async {
            dataSource.reposList = viewModel.reposListData
        }
    }
    func fetchReposList(usersListRequestValue: UsersListRequestValue = UsersListRequestValue(page: 1, searchText: "language:Swift")) {
        let request = ReposModel.LoadReposList.Request()
        interactor?.loadReposList(request: request, requestValues: usersListRequestValue)
    }
}
