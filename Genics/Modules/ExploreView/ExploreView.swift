//
//  ExploreView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .padding()
                .navigationTitle(Titles.exploreViewTitle)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
