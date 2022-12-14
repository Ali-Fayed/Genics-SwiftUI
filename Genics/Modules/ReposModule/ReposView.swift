//
//  ReposView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ReposView: View {
    let viewType: ReposListType
    @ObservedObject var dataSource = ReposViewDataSource()
    var interactor: ReposViewViewBusinessLogic?
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isSearching = false
    @State var isDataLoaded = false
    @State var searchText = ""
    var body: some View {
        if isDataLoaded {
            if viewType == .publicRepos {
                repoListWithSearch()
            } else if viewType == .userStarredRepos {
                reposList()
            } else if viewType == .userOwnedRpos {
                reposList()
            }
        } else {
            progressView()
        }
    }
    func repoListWithSearch() -> some View {
        reposList().searchable(text: $searchText, prompt: "Search")
            .onChange(of: searchText) { _ in
                performSearch()
            }
    }
    func reposList() -> some View {
        return List {
            ForEach(dataSource.reposModel(reposViewType: viewType), id: \.self) { repo in
                NavigationLink(destination: ReposDetails()){
                    ReposListCell(userAvatar: repo.repoOwnerAvatarURL, userName: repo.repoOwnerName, repoName: repo.repositoryName, repoDescription: repo.repositoryDescription ?? "", repoStarsCount: "\(repo.repositoryStars ?? 1)", repoLanguage: repo.repositoryLanguage ?? "", repoLanguageCircleColor: "red")
                }
            }
        }
    }
    func progressView() -> some View {
        return ProgressView().padding(.bottom, 60)
            .onAppear {
                fetchReposList()
            }.onChange(of: dataSource.reposList) { _ in
                withAnimation {
                    self.isDataLoaded = true
                }
            }.alert(isPresented: $dataSource.isShowingAlert) {
                presentAlert(title: "Error", message: dataSource.apiError?.localizedDescription.debugDescription ?? "")
            }
    }
    func performSearch() {
        if searchText.count > 2 {
            withAnimation {
                self.isSearching = true
            }
            let requestValues = UsersListRequestValue(page: 1, searchText: searchText)
            fetchReposList(usersListRequestValue: requestValues)
        } else if searchText.count == 0 {
            withAnimation {
                self.isSearching = false
                fetchReposList()
            }
        }
    }
}
struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView(viewType: .publicRepos)
    }
}
