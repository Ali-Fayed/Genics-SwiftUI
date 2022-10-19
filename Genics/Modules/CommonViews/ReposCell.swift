//
//  ReposCell.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ReposListCell: View {
    let userAvatar: String
    let userName: String
    let repoName: String
    let repoDescription: String
    let repoStarsCount: String
    let repoLanguage: String
    let repoLanguageCircleColor: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(userAvatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .cornerRadius(10, corners: .allCorners)
                     Text(userName)
                        .padding(2)
                }
                Text(repoName)
                    .padding(1)
                    .font(.system(size: 20, weight: .bold))
                Text(repoDescription)
                    .padding(1)
                HStack(spacing: 10) {
                    HStack(spacing: 2) {
                        Image("fav_star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .cornerRadius(10, corners: .allCorners)
                        Text(repoStarsCount)
                            .padding(1)
                    }
                    HStack(spacing: 2) {
                        Image(repoLanguageCircleColor)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .cornerRadius(10, corners: .allCorners)
                        Text(repoLanguage)
                            .padding(1)
                    }
                }
            }
            Spacer()
            NavigationLink(destination: ReposDetails()){}.frame(width: 10)
        }
    }
}
