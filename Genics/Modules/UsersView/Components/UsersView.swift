//
//  UsersView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI
struct UsersView: View {
    @ObservedObject var dataSource = UsersViewDataSource()
    @State var searchText = ""
    @State var isDataLoaded = false
    var interactor: UsersViewBusinessLogic?
    var body: some View {
        if isDataLoaded {
            usersList()
        } else {
            progressView()
        }
    }
}
 // MARK: - Users View Methods
extension UsersView {
    func usersList() -> some View {
        return List {
            ForEach(dataSource.usersList, id: \.self) { item in
                UsersListCell(userName: item.userName, userAvatar: item.userAvatar)
            }
        }.navigationTitle("Users")
            .searchable(text: $searchText, prompt: "Search Users")
             .onChange(of: searchText) { _ in
                    if searchText.count > 2 {
                        let requestValues = UsersListRequestValue(page: 1, searchText: searchText)
                        fetchUsersList(usersListRequestValue: requestValues)
                    } else if searchText.count == 0 {
                        fetchUsersList()
                    }
            }
    }
    func progressView() -> some View {
        return ProgressView().padding(.bottom, 60)
            .onAppear {
                fetchUsersList()
            }.onChange(of: dataSource.usersList) { _ in
                withAnimation {
                    self.isDataLoaded = true
                }
            }.alert(isPresented: $dataSource.isShowingAlert) {
                presentAlert(title: "Error", message: dataSource.apiError?.localizedDescription ?? "")
            }
    }
}
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
