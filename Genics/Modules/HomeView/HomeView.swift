//
//  HomeView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeDataSource = HomeDataSource()
    @State var searchText = ""
    @State var isSearchHistoryListHidden = true
    @State var isSearchNavigatorListHidden = true
    @Environment(\.openURL) var openURL
    var body: some View {
        NavigationView {
            List {
                if isSearchNavigatorListHidden && isSearchHistoryListHidden {
                    featuresSection()
                    repoSection()
                    authenticationStatusSection()
                } else if !isSearchHistoryListHidden && isSearchNavigatorListHidden == true {
                    searchHistoryList()
                } else if !isSearchNavigatorListHidden && isSearchHistoryListHidden == true {
                    searchNavigatorList()
                }
            }.navigationTitle("Home")
        }.searchable(text: $searchText, prompt: "Look for something")
        .onChange(of: searchText) { newValue in
            withAnimation {
                if searchText.count > 0 {
                    self.isSearchHistoryListHidden = true
                    self.isSearchNavigatorListHidden = false
                } else {
                    self.isSearchNavigatorListHidden = true
                    self.isSearchHistoryListHidden = true
                }
            }
        }
    }
    func searchNavigatorList() -> some View {
        return ForEach(homeDataSource.searchNavigatorData, id: \.self) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .cornerRadius(10, corners: .allCorners)
                Text(item.title + "'\(searchText)'")
                    .padding(10)
                if item.id == 0 {
                    Spacer()
                    NavigationLink(destination: UsersView()) {}.frame(width: 10)
                } else if item.id == 1 {
                    Spacer()
                    NavigationLink(destination: ReposView()) {}.frame(width: 10)
                }  else if item.id == 2 {
                    Spacer()
                    NavigationLink(destination: IssuesView()) {}.frame(width: 10)
                }
            }
        }
    }
    func searchHistoryList() -> some View {
        return ForEach(homeDataSource.searchHistory, id: \.self) { item in
            HStack {
                Text(item)
                .padding(7)
                Spacer()
                Image(systemName: "arrow.up.backward.circle.fill")
            }
        }
    }
    func featuresSection() -> some View {
        return Section {
            ForEach(homeDataSource.homeData, id: \.self) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .cornerRadius(10, corners: .allCorners)
                    Text(item.title)
                        .padding(7)
                    if item.id == 0 {
                        NavigationLink(destination: UsersViewContentView()) {}
                    } else if item.id == 1 {
                        NavigationLink(destination: ReposView()) {}
                    } else if item.id == 2 {
                        NavigationLink(destination: IssuesView()) {}
                    } else if item.id == 3 {
                        NavigationLink(destination: StarredView()) {}
                    } else if item.id == 4 {
                        NavigationLink(destination: OrgsView()) {}
                    }
                }
            }
        } header: {
            Text("Features")
        }
    }
    func repoSection() -> some View {
        return Section {
            HStack {
                Image("ali")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .cornerRadius(10, corners: .allCorners)
                Text("Genics Repository")
                    .padding(7)
                Spacer()
                DisclosureIndicatorRow { openURL(URL(string: "https://github.com/Ali-Fayed/Githubgenics")!) } label: {}.frame(width: 50).foregroundColor(.gray)
            }
        } header: {
            Text("Repo")
        }
    }
    func authenticationStatusSection() -> some View {
        return                 Section {
            Text("Authenticated User Mode")
                .padding(7)
        } header: {
            Text("State")
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
