//
//  TabBarView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "lightbulb.fill")
                }
            BookmarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.fill")
                }
            NoteView()
                .tabItem {
                    Label("Note", systemImage: "note.text")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
            }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
