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
            AsyncImage(url: URL(string: userAvatar)!,
                          placeholder: { Text("Loading ...") },
                          image: { Image(uiImage: $0).resizable() })
            .frame(width: 50, height: 50)
            .cornerRadius(25, corners: .allCorners)
            Text(userName)
            .padding(8)
            Spacer()
            NavigationLink(destination: UsersDetailsView()){}.frame(width: 10)
        }
    }
}
