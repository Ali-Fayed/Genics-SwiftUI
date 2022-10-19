//
//  GenicsApp.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

@main
struct GenicsApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            SplashView().preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
