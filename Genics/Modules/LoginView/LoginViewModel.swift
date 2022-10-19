//
//  SignInViewModel.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import UIKit
import AuthenticationServices
import SwiftUI

class SignInViewModel: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    typealias ASPresentationAnchor = UIWindow
    var webAuthenticationSession: ASWebAuthenticationSession?
    @Published var isAuthenticated = false
    func getGitHubAccessToken () {
        var authorizeURLComponents = URLComponents(string: Constants.authorizeURL)
        authorizeURLComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.clientID),
            URLQueryItem(name: "scope", value: Constants.scope)
        ]
        guard let authorizeURL = authorizeURLComponents?.url else {
            return
        }
        webAuthenticationSession = ASWebAuthenticationSession.init(
            url: authorizeURL,
            callbackURLScheme: Constants.redirectURI) { (callBack: URL?, error: Error?) in
            guard
                error == nil,
                let successURL = callBack
            else {
                return
            }
            // Retrieve access code
            guard let accessCode = URLComponents(string: (successURL.absoluteString))?
                    .queryItems?.first(where: { $0.name == "code" })?.value else {
                return
            }
            // fetch token using access code
            TokenManager.shared.fetchAccessToken(accessToken: accessCode) { isSuccess in
                self.isAuthenticated = true
            }
        }
        webAuthenticationSession?.presentationContextProvider = self
        webAuthenticationSession?.start()
    }
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
