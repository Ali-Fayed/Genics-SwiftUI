//
//  ReposViewModel.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import Foundation

protocol ReposViewViewBusinessLogic {
    func loadReposList(request: ReposModel.LoadReposList.Request, requestValues: UsersListRequestValue)
}
class ReposViewInteractor: ReposViewViewBusinessLogic {
    var presenter: ReposViewPresentationLogic?
    var useCase: ReposViewUseCase
    init(useCase: ReposViewUseCase = ReposViewUseCase()) {
        self.useCase = useCase
    }
    func loadReposList(request: ReposModel.LoadReposList.Request, requestValues: UsersListRequestValue) {
        Task {
            do {
                let reposList = try await useCase.fetchRepos(usersListRequestValue: requestValues)
                let response = ReposModel.LoadReposList.ReposListResponse(reposListData: reposList)
                self.presenter?.presentReposListData(response: response)
            } catch let error {
                let error = ReposModel.LoadReposList.ApiError(error: error)
                self.presenter?.presentReposListError(response: error)
            }
        }
    }
}
