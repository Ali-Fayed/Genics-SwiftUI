//
//  IssuesView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct IssuesView: View {
    @StateObject var viewModel = IssesViewModel()
    @State var searchText = ""
    var body: some View {
        List {
            ForEach(viewModel.issues, id: \.self) { item in
                HStack {
                    Text(item)
                    .padding(8)
                    Spacer()
                    NavigationLink(destination: UsersDetailsView()){}.frame(width: 10)
                }
            }
        }.navigationTitle("Issues").searchable(text: $searchText, prompt: "Search Issues")
    }
}

struct IssuesView_Previews: PreviewProvider {
    static var previews: some View {
        IssuesView()
    }
}
