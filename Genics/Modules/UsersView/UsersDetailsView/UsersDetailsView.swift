//
//  UsersDetailsView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct UsersDetailsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let item: User
    var body: some View {
        Text("here details about \(item.userName)").toolbar {
            ToolbarItem {
                Button {
                    addItem(userName: item.userName, avatarName: item.userAvatar)
                } label: {
                    Label("Add Item", systemImage: "heart.fill")
                }
            }
            ToolbarItem {
                Button(action: shareUser) {
                    Label("", systemImage: "square.and.arrow.up")
                }
            }
        }
    }
    private func shareUser() {
    }
    private func addItem(userName: String, avatarName: String) {
        withAnimation {
            let newItem = SavedUsers(context: viewContext)
            newItem.userName = userName
            newItem.userAvatar = avatarName
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
struct UsersDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UsersDetailsView(item: User(userName: "", userAvatar: ""))
    }
}
struct collectionView: View {
    let items: [User]
    var body: some View {
        VStack{
            Divider()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:10){
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
                            .fill(Color.yellow)
                            .frame(width: 70, height: 50)
                        ForEach(items, id: \.self) { item in
                            Image(item.userAvatar)
                        }
                    }
                }.padding(5)
            }.frame(height:100)
            Divider()
            Spacer()
        }
    }
}
