//
//  BookmarksView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct BookmarksView: View {
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                Section {
                    UsersListCell(userName: "Ali", userAvatar: "ali")
                } header: {
                    Text("Users")
                }
                Section {
                    ReposListCell(userAvatar: "ali", userName: "Ali", repoName: "Alamofire", repoDescription: "asljndjksandjksandjkasndas", repoStarsCount: "12334", repoLanguage: "Swift", repoLanguageCircleColor: "red")
                } header: {
                    Text("Repositories")
                }
            }.navigationTitle("Bookmarks")
        }.searchable(text: $searchText, prompt: "Search Bookmarks")
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
