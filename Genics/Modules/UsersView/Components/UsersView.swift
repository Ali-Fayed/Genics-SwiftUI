//
//  UsersView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI
struct UsersView: View {
    @ObservedObject var dataSource = UsersViewDataSource()
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isShareSheetPresented = false
    @State private var isSearching = false
    var interactor: UsersViewBusinessLogic?
    @State var searchText = ""
    @State var isDataLoaded = false
    var body: some View {
        if isDataLoaded { usersList() } else { progressView() }
    }
}
// MARK: - Users View Methods
extension UsersView {
    func usersList() -> some View {
        return List {
            if !isSearching {
                Section {
                    topUsersSection()
                } header: {
                    Text("Top Users")
                }
            }
            Section {
                usersListSection()
            } header: {
                Text("Users")
            }
        }.navigationTitle("Users")
            .searchable(text: $searchText, prompt: "Search Users")
            .onChange(of: searchText) { _ in
                performSearch()
            }
    }
    func progressView() -> some View {
        return ProgressView().padding(.bottom, 60)
            .onAppear {
                fetchUsersList()
            }.onChange(of: dataSource.usersList) { _ in
                withAnimation {
                    self.isDataLoaded = true
                }
            }.alert(isPresented: $dataSource.isShowingAlert) {
                presentAlert(title: "Error", message: dataSource.apiError?.localizedDescription ?? "")
            }
    }
    func performSearch() {
        if searchText.count > 2 {
            withAnimation {
                self.isSearching = true
            }
            let requestValues = UsersListRequestValue(page: 1, searchText: searchText)
            fetchUsersList(usersListRequestValue: requestValues)
        } else if searchText.count == 0 {
            withAnimation {
                self.isSearching = false
            }
            fetchUsersList()
        }
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
    func contextMenubookmarkButton(item: User) -> some View {
        Button {
            addItem(userName: item.userName, avatarName: item.userAvatar)
        } label: {
            Label("Bookmark", systemImage: "bookmark.fill")
        }
    }
    func contextMenuShareButton() -> some View {
        return Button {
            self.isShareSheetPresented = true
        } label: {
            Label("Share", systemImage: "square.and.arrow.up")
        }
    }
    func usersListSection() -> some View {
        return  ForEach(0..<dataSource.usersList.count, id: \.self) { index in
            NavigationLink(destination: UsersDetailsView(item: dataSource.usersList[index])) {
                UsersListCell(userName: dataSource.usersList[index].userName, userAvatar: dataSource.usersList[index].userAvatar)
                    .contextMenu {
                    contextMenubookmarkButton(item: dataSource.usersList[index])
                    contextMenuShareButton()
                }.sheet(isPresented: $isShareSheetPresented) {
                    ShareSheetView(activityItems: [dataSource.usersList[index].userName])
                }
            }
        }
    }
    func topUsersSection() -> some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(dataSource.topUsers, id: \.self) { item in
                        NavigationLink(destination: UsersDetailsView(item: item)) {
                            VStack {
                                ZStack{
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 80, height: 80)
                                    AsyncImage(url: URL(string: item.userAvatar)!,
                                               placeholder: { ProgressView() },
                                               image: { Image(uiImage: $0).resizable() })
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(25, corners: .allCorners)
                                }
                                Text(item.userName)
                                    .padding(5)
                                    .foregroundColor(.gray).font(.system(size: 15))
                            }
                        }
                        
                    }
                }
            }
        }
    }
}
// MARK: - Users View Preview
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
