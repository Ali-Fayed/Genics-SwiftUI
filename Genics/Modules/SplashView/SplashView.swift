//
//  File.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI
import CoreData

struct SplashView: View {
    var isLoggedIn = false
    @State var isPresentingLoginView = false
    @State var isPresentingHomeView = false
    var body: some View {
        ZStack {
            Color("ViewsColorBallet")
            .ignoresSafeArea()
            LottieView(lottieFile: "loadingspinner")
                .frame(width: 140, height: 140)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        if !isLoggedIn {
                            self.isPresentingLoginView = true
                        } else {
                            self.isPresentingHomeView = true
                        }
                    }
                }
                .fullScreenCover(isPresented: $isPresentingLoginView, onDismiss: {
                    print("TabBarDismissed")
                }, content: {
                    LoginView().edgesIgnoringSafeArea(.all)
                })
                .fullScreenCover(isPresented: $isPresentingHomeView, onDismiss: {
                    print("TabBarDismissed")
                }, content: {
                    HomeView().edgesIgnoringSafeArea(.all)
                })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView().preferredColorScheme(.dark)
    }
}
