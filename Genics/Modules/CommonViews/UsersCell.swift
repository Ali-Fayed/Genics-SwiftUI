//
//  UsersCell.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct UsersListCell: View {
    let userName: String
    let userAvatar: String
    var body: some View {
        HStack(spacing: 10) {
            Image(userAvatar)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .cornerRadius(10, corners: .allCorners)
            Text(userName)
            .padding(8)
            Spacer()
            NavigationLink(destination: UsersDetailsView()){}.frame(width: 10)
        }
    }
}
