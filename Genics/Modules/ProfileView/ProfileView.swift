//
//  ProfileView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var dataSource = ProfileDataSource()
    @State var isSettingsIconTapped = false
    @State var isShareIconTapped = false
    var body: some View {
            NavigationView {
                    List {
                        Section {
                            profileListItems()
                        } header: {
                            profileViewHeader(userName: "Ali-Fayed", userFullName: "Ali Fayed", userAvatar: "ali", userFollowing: "2", userFollowers: "16")
                        }
                    }.navigationTitle("Profile").toolbar {
                    ToolbarItem {
                        Button(action: shareUser) {
                            Label("", systemImage: "square.and.arrow.up")
                        }
                    }
                    ToolbarItem {
                        Button(action: presentSettings) {
                            Label("", systemImage: "gearshape")
                        }
                    }
                }.background(
                    NavigationLink(destination: SettingsView(),
                            isActive: $isSettingsIconTapped) {}
                ).background(
                    NavigationLink(destination: UserRepositoriesContentView().navigationTitle("Repositories"),
                            isActive: $isShareIconTapped) {}
                )
            }
    }
    private func presentSettings() {
        self.isSettingsIconTapped = true
    }
    private func shareUser() {
        self.isShareIconTapped = true
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
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
struct profileViewHeader: View {
    let userName: String
    let userFullName: String
    let userAvatar: String
    let userFollowing: String
    let userFollowers: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 10) {
                AsyncImage(url: URL(string: userAvatar)!,
                              placeholder: { ProgressView() },
                              image: { Image(uiImage: $0).resizable() })
                .frame(width: 50, height: 50)
                    .cornerRadius(25, corners: .allCorners)
                VStack(alignment: .leading) {
                    Text(userFullName).font(.system(size: 23, weight: .bold)).foregroundColor(.primary)
                    Text(userName)
                        .foregroundColor(.gray)
                }
            }.padding(5)
            HStack(spacing: 5) {
                Image("ali")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .cornerRadius(25, corners: .allCorners)
                    .padding(.leading, 10)
                Text("Working From Home").foregroundColor(.primary)
                    .padding(5)
                Spacer()
            }.overlay {
                    Color.gray.opacity(0.1)
            }
            Text("Junior iOS Engineer worked in Fixed Solutions")
                .padding(5).foregroundColor(.primary)
            HStack(spacing: 30) {
                HStack {
                    Image("ali")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .cornerRadius(25, corners: .allCorners)
                    Text("Fixed Solutions").foregroundColor(.primary)
                }
                HStack {
                    Image("ali")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .cornerRadius(25, corners: .allCorners)
                    Text("Cairo Egypt")
                        .foregroundColor(.gray)
                }
            }.padding(5)
            HStack {
                Image("ali")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .cornerRadius(25, corners: .allCorners)
                Text("@aliifayed".lowercased()).font(.system(size: 15, weight: .medium)).foregroundColor(.primary)
            }.padding(5)
            HStack(spacing: 10) {
                HStack {
                    Image("ali")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .cornerRadius(25, corners: .allCorners)
                    Text(userFollowers).foregroundColor(.primary)
                    Text("followers").foregroundColor(.gray)
                }
                Text(".")
                HStack {
                    Text(userFollowing).foregroundColor(.primary)
                    Text("following").foregroundColor(.gray)
                }
            }.padding(5)
        }

    }
}
import Foundation
import SwiftUI

class ProfileDataSource: ObservableObject {
    var profileData: [HomeDataModel] = [.init(id: 0, title: "Repositories", image: "Repositories"), .init(id: 1, title: "Starred", image: "Startted"), .init(id: 2, title: "Organizations", image: "Organizations")]
}
