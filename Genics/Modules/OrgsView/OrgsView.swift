//
//  OrgsView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct OrgsView: View {
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        List {
            OrgsListCell(orgsName: "Apple", orgsAvatar: "ali")
        }.navigationTitle("Organizations")
    }
}

struct OrgsView_Previews: PreviewProvider {
    static var previews: some View {
        OrgsView()
    }
}
