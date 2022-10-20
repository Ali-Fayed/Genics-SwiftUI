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
            List {
                Section {
                    VStack {
                        Image("header")  .resizable()
                            .scaledToFit()
                            .background(Color.red)
                            .frame(width: 400, height: 150)
                            .cornerRadius(10, corners: .allCorners)
                        Spacer()
                    }
                } header: {
                    Text("Discover")
                }

            }.navigationTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
