//
//  HomeView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .padding()
                .navigationTitle(Titles.homeViewTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
