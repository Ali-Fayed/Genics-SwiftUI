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
                    Label(Titles.homeViewTitle, systemImage: "homekit")
                }
            ExploreView()
                .tabItem {
                    Label(Titles.exploreViewTitle, systemImage: "lightbulb.fill")
                }
            BookmarksView()
                .tabItem {
                    Label(Titles.bookmarksViewTitle, systemImage: "bookmark.fill")
                }
            NoteView()
                .tabItem {
                    Label(Titles.noteViewTitle, systemImage: "note.text")
                }
            ProfileView()
                .tabItem {
                    Label(Titles.profileViewTitle, systemImage: "person.fill")
            }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
