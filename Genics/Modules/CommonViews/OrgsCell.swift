//
//  OrgsCell.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct OrgsListCell: View {
    let orgsName: String
    let orgsAvatar: String
    var body: some View {
        HStack(spacing: 10) {
            Image(orgsAvatar)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .cornerRadius(10, corners: .allCorners)
            Text(orgsName)
            .padding(8)
            Spacer()
        }
    }
}
