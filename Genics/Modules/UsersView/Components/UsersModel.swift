//
//  UsersModel.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import Foundation

enum UsersModel {
  enum LoadUsersList {
    struct Request {}

    struct Response {
      var usersListData: [User]
    }
    struct ApiError {
        var error: Error
      }
    struct ViewModel {
        var usersListData: [User]
    }
  }
}
struct UsersListRequestValue {
    let page: Int
    let searchText: String
}
