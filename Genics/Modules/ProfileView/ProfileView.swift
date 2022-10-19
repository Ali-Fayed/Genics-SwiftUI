//
//  ProfileView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct ProfileView: View {
    @State var isSettingsIconTapped = false
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
                }.background(
                    NavigationLink(destination: SettingsView().edgesIgnoringSafeArea(.all),
                            isActive: $isSettingsIconTapped) {EmptyView()}
                )
        }
    }
    private func presentSettings() {
        self.isSettingsIconTapped = true
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
