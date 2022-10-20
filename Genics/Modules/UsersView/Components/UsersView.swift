//
//  UsersView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI
struct UsersView: View {
    @ObservedObject var viewDataSource = UsersViewDataSource()
    @State var searchText = ""
    var interactor: UsersViewBusinessLogic?
    var body: some View {
        List {
            ForEach(viewDataSource.usersList, id: \.self) { item in
                UsersListCell(userName: item.userName, userAvatar: item.userAvatar)
            }
        }.navigationTitle("Users")
            .searchable(text: $searchText, prompt: "Search Users").onAppear {
            fetchUsersList()
        }.alert(isPresented: $viewDataSource.isShowingAlert) {
            Alert (
                title: Text("Error"),
                message: Text(viewDataSource.apiError?.localizedDescription ?? ""),
                primaryButton: .destructive(Text("Yes"), action: {
                   
                }),
                secondaryButton: .default(Text("Cancel"), action: {
                    print("Cancel")
                })
            )
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
