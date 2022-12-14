//
//  ReposViewContentView.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//
import SwiftUI

struct ReposViewContentView: View {
  var body: some View {
      ReposView(viewType: .publicRepos).configureView()
  }
}
extension ReposView {
  func configureView() -> some View {
    var view = self
    let interactor = ReposViewInteractor()
    let presenter = ReposViewPresenter()
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    return view
  }
}
