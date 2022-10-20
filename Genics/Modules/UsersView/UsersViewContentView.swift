//
//  UserConfigurator.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import SwiftUI

struct UsersViewContentView: View {
  var body: some View {
    UsersView().configureView()
  }
}
extension UsersView {
  func configureView() -> some View {
    var view = self
    let interactor = UsersViewInteractor()
    let presenter = UsersViewPresenter()
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    return view
  }
}
