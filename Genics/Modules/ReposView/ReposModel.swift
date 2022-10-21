//
//  ReposModel.swift
//  Genics
//
//  Created by Ali Fixed on 19/10/2022.
//

import Foundation
enum ReposModel {
  enum LoadReposList {
    struct Request {}

    struct ReposListResponse {
      var reposListData: [Repository]
    }
    struct ApiError {
        var error: Error
      }
    struct ViewModel {
        var reposListData: [Repository]
    }
  }
}
