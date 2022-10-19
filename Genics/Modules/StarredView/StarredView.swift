//
//  StarredView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct StarredView: View {
    var body: some View {
        List {
            ReposListCell(userAvatar: "ali", userName: "alifayed", repoName: "KingFisher", repoDescription: "LightWieght Swift Library for downlaoding images from apis", repoStarsCount: "1334", repoLanguage: "Swift", repoLanguageCircleColor: "red")
        }.navigationTitle(Titles.starredViewTitle)
    }
}

struct StarredView_Previews: PreviewProvider {
    static var previews: some View {
        StarredView()
    }
}
