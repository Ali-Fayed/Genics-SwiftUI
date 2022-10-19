//
//  UsersView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct UsersView: View {
    @StateObject var viewModel = UserViewModel()
    @State var searchText = ""
    var body: some View {
        List {
            ForEach(viewModel.users, id: \.self) { item in
                UsersListCell(userName: item, userAvatar: "ali")
            }
        }.navigationTitle(Titles.usersViewTitle).searchable(text: $searchText, prompt: "Search Users")
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
