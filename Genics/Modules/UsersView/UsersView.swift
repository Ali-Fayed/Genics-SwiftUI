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
                HStack(spacing: 10) {
                    Image("ali")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .cornerRadius(10, corners: .allCorners)
                    Text(item)
                    .padding(8)
                    Spacer()
                    NavigationLink(destination: UsersDetailsView()){}.frame(width: 10)
                }
            }
        }.navigationTitle(Titles.usersViewTitle).searchable(text: $searchText, prompt: "Search Users")
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
