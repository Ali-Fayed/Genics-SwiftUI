//
//  BookmarksView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct BookmarksView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .padding()
                .navigationTitle(Titles.bookmarksViewTitle)
        }
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
