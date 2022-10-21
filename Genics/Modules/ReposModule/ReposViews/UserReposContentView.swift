//
//  UserReposContentView.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation
import SwiftUI
struct UserRepositoriesView: View {
    var body: some View {
        EmptyView()
    }
}
struct UserRepositoriesContentView: View {
    var body: some View {
        UserRepositoriesView().configureView()
    }
}
extension UserRepositoriesView {
  func configureView() -> some View {
      var view = ReposView(viewType: .userOwnedRpos)
    let interactor = ReposViewInteractor()
    let presenter = ReposViewPresenter()
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    return view
  }
}
