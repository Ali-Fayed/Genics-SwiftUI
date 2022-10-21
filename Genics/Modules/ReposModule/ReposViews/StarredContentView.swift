//
//  StarredView.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import SwiftUI

struct StarredView: View {
    var body: some View {
        EmptyView()
    }
}
struct StarredViewContentView: View {
    var body: some View {
      StarredView().configureView()
    }
}
extension StarredView {
  func configureView() -> some View {
      var view = ReposView(viewType: .userStarredRepos)
    let interactor = ReposViewInteractor()
    let presenter = ReposViewPresenter()
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    return view
  }
}
