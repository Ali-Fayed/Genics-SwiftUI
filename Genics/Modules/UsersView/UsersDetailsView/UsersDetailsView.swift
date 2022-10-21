//
//  UsersDetailsView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct UsersDetailsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let item: User
    @ObservedObject var dataSource = ProfileDataSource()
    var body: some View {
        List {
            Section {
                profileListItems()
            } header: {
                profileViewHeader(userName: item.userName, userFullName: item.userName, userAvatar: item.userAvatar, userFollowing: "2", userFollowers: "16")
            }
        }.navigationTitle("User Details").toolbar {
            ToolbarItem {
                Button {
                    addItem(userName: item.userName, avatarName: item.userAvatar)
                } label: {
                    Label("Add Item", systemImage: "heart.fill")
                }
            }
            ToolbarItem {
                Button(action: shareUser) {
                    Label("", systemImage: "square.and.arrow.up")
                }
            }
        }
    }
    private func profileListItems() -> some View {
        return ForEach(Array(dataSource.profileData), id: \.self) { item in
            HStack(spacing: 10) {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .cornerRadius(10, corners: .allCorners)
                    .padding(.leading, -10)
                Text(item.title)
                if item.id == 0 {
                    Spacer()
                    NavigationLink(destination: UserRepositoriesContentView().navigationTitle("Repository")) {}.frame(width: 10)
                } else if item.id == 1 {
                    Spacer()
                    NavigationLink(destination: StarredViewContentView().navigationTitle("Starred")) {}.frame(width: 10)
                }  else if item.id == 2 {
                    Spacer()
                    NavigationLink(destination: OrgsView()) {}.frame(width: 10)
                }
            }
        }.padding(7)
    }
    private func shareUser() {
    }
    private func addItem(userName: String, avatarName: String) {
        withAnimation {
            let newItem = SavedUsers(context: viewContext)
            newItem.userName = userName
            newItem.userAvatar = avatarName
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
struct UsersDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UsersDetailsView(item: User(userName: "", userURL: "", userAvatar: "", userFollowing: "", userFollowers: ""))
    }
}
struct collectionView: View {
    let items: [User]
    var body: some View {
        VStack{
            Divider()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:10){
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
                            .fill(Color.yellow)
                            .frame(width: 70, height: 50)
                        ForEach(items, id: \.self) { item in
                            Image(item.userAvatar)
                        }
                    }
                }.padding(5)
            }.frame(height:100)
            Divider()
            Spacer()
        }
    }
}
