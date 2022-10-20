//
//  ReposView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ReposView: View {
    @StateObject var viewModel = UserViewModel()
    @State var searchText = ""
    var body: some View {
        List {
            ReposListCell(userAvatar: "ali", userName: "alifayed", repoName: "KingFisher", repoDescription: "LightWieght Swift Library for downlaoding images from apis", repoStarsCount: "1334", repoLanguage: "Swift", repoLanguageCircleColor: "red")
        }.navigationTitle("Repositories").searchable(text: $searchText, prompt: "Search Repositories")
    }
}

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView()
    }
}

class UserViewModel: ObservableObject {
    var users = ["1", "2", "3", "1", "2", "3", "1", "2", "3", "1", "2", "3"]
}
