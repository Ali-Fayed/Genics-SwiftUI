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
                    List {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 10) {
                                Image("ali")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(25, corners: .allCorners)
                                VStack(alignment: .leading) {
                                    Text("Ali Fayed").font(.system(size: 23, weight: .bold))
                                    Text("Ali-Fayed")
                                        .foregroundColor(.gray)
                                }
                            }.padding(5)
                            HStack(spacing: 5) {
                                Image("ali")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(25, corners: .allCorners)
                                    .padding(.leading, 10)
                                Text("Working From Home")
                                    .padding(5)
                                Spacer()
                            }.overlay {
                                    Color.gray.opacity(0.1)
                            }
                            Text("Junior iOS Engineer worked in Fixed Solutions")
                                .padding(5)
                            HStack(spacing: 30) {
                                HStack {
                                    Image("ali")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(25, corners: .allCorners)
                                    Text("Fixed Solutions")
                                }
                                HStack {
                                    Image("ali")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(25, corners: .allCorners)
                                    Text("Cairo Egypt")
                                        .foregroundColor(.gray)
                                }
                            }.padding(5)
                            HStack {
                                Image("ali")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(25, corners: .allCorners)
                                Text("@aliifayed").font(.system(size: 17, weight: .bold))
                            }.padding(5)
                            HStack(spacing: 10) {
                                HStack {
                                    Image("ali")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(25, corners: .allCorners)
                                    Text("16")
                                    Text("followers").foregroundColor(.gray)
                                }
                                Text(".")
                                HStack {
                                    Text("2")
                                    Text("following").foregroundColor(.gray)
                                }
                            }.padding(5)
                        }
                    }
                .navigationTitle(Titles.profileViewTitle).toolbar {
                    ToolbarItem {
                        Button(action: shareUser) {
                            Label("", systemImage: "square.and.arrow.up")
                        }
                    }
                    ToolbarItem {
                        Button(action: presentSettings) {
                            Label("", systemImage: "gearshape")
                        }
                    }
                }.background(
                    NavigationLink(destination: SettingsView(),
                            isActive: $isSettingsIconTapped) {}
                )
            }
        
    }
    private func presentSettings() {
        self.isSettingsIconTapped = true
    }
    private func shareUser() {
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
