//
//  ReposPresenter.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation

protocol ReposViewPresentationLogic {
  func presentReposListData(response: ReposModel.LoadReposList.ReposListResponse)
  func presentReposListError(response: ReposModel.LoadReposList.ApiError)
}
class ReposViewPresenter: ReposViewPresentationLogic {
  var view: ReposViewDisplayLogic?
    func presentReposListError(response: ReposModel.LoadReposList.ApiError) {
        let error = ReposModel.LoadReposList.ApiError(error: response.error)
        view?.displayError(error: error, isShowingAlert: true)
    }
    func presentReposListData(response: ReposModel.LoadReposList.ReposListResponse) {
    let viewModel = ReposModel.LoadReposList.ViewModel (
        reposListData: response.reposListData, starredReposData: response.starredReposData, userRepos: response.userRepos
    )
    view?.displayReposList(viewModel: viewModel)
  }
}
