//
//  HomeView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var searchedText = ""
    var body: some View {
        NavigationView {
            List {
                featuresSection()
                repoSection()
                authenticationStatusSection()
            }.navigationTitle(Titles.homeViewTitle)
        }.searchable(text: $searchedText)
    }
    func featuresSection() -> some View {
        return Section {
            ForEach(viewModel.homeData, id: \.self) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .cornerRadius(10, corners: .allCorners)
                    Text(item.title)
                        .padding(10)
                    if item.id == 0 {
                        NavigationLink(destination: UsersView()) {}
                    } else if item.id == 1 {
                        NavigationLink(destination: ReposView()) {}
                    } else if item.id == 2 {
                        NavigationLink(destination: IssuesView()) {}
                    } else if item.id == 3 {
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
                    .padding(10)
//                        Link(destination: URL(string: "https://github.com/Ali-Fayed/Githubgenics")!) {}
            }
        } header: {
            Text("Repo")
        }
    }
    func authenticationStatusSection() -> some View {
        return                 Section {
            Text("Authenticated User Mode")
                .padding(10)
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
