//
//  ReposDataSource.swift
//  Genics
//
//  Created by Ali Fixed on 21/10/2022.
//

import Foundation
class ReposViewDataSource: ObservableObject {
  @Published var reposList: [Repository] = []
  @Published var apiError: Error?
  @Published var isShowingAlert = false
}
