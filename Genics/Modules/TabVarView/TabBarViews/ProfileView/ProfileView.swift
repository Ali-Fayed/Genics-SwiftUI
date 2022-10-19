//
//  ProfileView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .padding()
                .navigationTitle(Titles.profileViewTitle)
                .toolbar {
                    ToolbarItem {
                        Button(action: presentSettings) {
                            Label("", systemImage: "gearshape")
                        }
                    }
                }
        }
    }
    private func presentSettings() {
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
