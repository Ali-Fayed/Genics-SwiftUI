//
//  UsersDataSource.swift
//  Genics
//
//  Created by Ali Fixed on 20/10/2022.
//

import Foundation
class UsersViewDataSource: ObservableObject {
  @Published var usersList: [User] = []
  @Published var apiError: Error?
  @Published var isShowingAlert = false
}
#if DEBUG
extension UsersViewDataSource {
  static var sample: UsersViewDataSource {
    let model = UsersViewDataSource()
      model.usersList = [.init(userName: "Ali", userAvatar: "ali")]
    return model
  }
}
#endif
