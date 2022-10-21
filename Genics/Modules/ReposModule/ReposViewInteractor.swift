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
                let starredRepos = try await useCase.fetchStarred()
                let userRepos = try await useCase.fetchUserRepos()
                let response = ReposModel.LoadReposList.ReposListResponse(reposListData: reposList, starredReposData: starredRepos, userRepos: userRepos)
                self.presenter?.presentReposListData(response: response)
            } catch let error {
                let error = ReposModel.LoadReposList.ApiError(error: error)
                self.presenter?.presentReposListError(response: error)
            }
        }
    }
}
