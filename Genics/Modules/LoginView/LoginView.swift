//
//  LoginView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI
struct LoginView: View {
    @StateObject var viewModel = SignInViewModel()
    @State var isShowingLogin = false
    @State var isPresentingHomeView = false
    var body: some View {
        ZStack {
            Color("ViewsColorBallet")
                .ignoresSafeArea()
        VStack {
                githubLogoImage()
                Spacer()
                loginButton()
                termsView()
                .confirmationDialog("Guest mode is for limited time of usage but auth mode is infinity time of usage", isPresented: $isShowingLogin, titleVisibility: .visible) {
                            Button("Guest Mode") {
                                self.isPresentingHomeView = true
                            }
                            Button("Authenticated Mode") {
                                viewModel.getGitHubAccessToken()
                            }
                }
                .fullScreenCover(isPresented: $isPresentingHomeView, onDismiss: {
                    print("TabBarDismissed")
                }, content: {
                    TabBarView().edgesIgnoringSafeArea(.all)
                })
                .fullScreenCover(isPresented: $viewModel.isAuthenticated, onDismiss: {
                    print("TabBarDismissed")
                }, content: {
                    TabBarView().edgesIgnoringSafeArea(.all)
                })
            }
        }
    }
    func githubLogoImage() -> some View {
        return Image("Github")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .padding(.top, 250)
    }
    func loginButton() -> some View {
        return LargeButton(title: "Sign in with Github",
                                           backgroundColor: Color.primary) {
                                   self.isShowingLogin = true
                               }
    }
    func termsView() -> some View {
        return Text(AppConstants.termsTitle)
            .padding()
            .padding(.bottom, 50)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

