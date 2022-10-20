//
//  SettingsView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var previewIndex = 0
    var previewOptions = ["Automatic", "Light", "Dark"]
    var appIcon = ["Default"]
    var body: some View {
        Form {
            Section(header: Text("Apperance")) {
                Picker(selection: $previewIndex, label: Text("Appearance")) {
                    ForEach(0 ..< previewOptions.count) {
                        Text(self.previewOptions[$0])
                    }
                }
                Picker(selection: $previewIndex, label: Text("App Icon")) {
                    ForEach(0 ..< appIcon.count) {
                        Text(self.appIcon[$0])
                    }
                }
            }
            Section(header: Text("Informations")) {
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Terms of Services").foregroundColor(.primary)
                }
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Privacy Policy").foregroundColor(.primary)
                }
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Repository Page").foregroundColor(.primary)
                }
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Send Feedback").foregroundColor(.primary)
                }
            }
            Section(header: Text("Privacy")) {
                Button(action: {
                    print("Perform an action here...")
                }) {
                    VStack(alignment: .center) {
                        Text("Reset All Settings")
                    }
                }
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Sign Out").foregroundColor(.red)
                }
            }
            Section(header: Text("ABOUT")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.02")
                }
            }
        }.navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
