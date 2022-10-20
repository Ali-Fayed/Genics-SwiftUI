//
//  BookmarksView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct BookmarksView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedUsers.userName, ascending: true)],
        animation: .default)
    private var users: FetchedResults<SavedUsers>
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(users) { item in
                        UsersListCell(userName: item.userName ?? "", userAvatar: item.userAvatar ?? "")
                    }.onDelete(perform: deleteItems)
                } header: {
                    Text("Users")
                }
                Section {
                    ReposListCell(userAvatar: "ali", userName: "Ali", repoName: "Alamofire", repoDescription: "asljndjksandjksandjkasndas", repoStarsCount: "12334", repoLanguage: "Swift", repoLanguageCircleColor: "red")
                } header: {
                    Text("Repositories")
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }.navigationTitle("Bookmarks")
        }
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { users[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
