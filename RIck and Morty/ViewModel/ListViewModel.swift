//
//  CharacterViewModel.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

class ListViewModel {

  private (set) var dataSource: [CharacterCellViewState] = []
  private var characters: [CharacterModel] = []
  private var currentPage = 1
  private let router: ListRouter
  private let networkManager: NetworkManager

  init(router: ListRouter, networkManager: NetworkManager = NetworkManager()) {
    self.router = router
    self.networkManager = networkManager
  }

  func getCharacterList(_ completionHandler: @escaping () -> Void) {
    networkManager.fetchData(page: currentPage, completionHandler: { characters in
      self.characters += characters
      self.dataSource += characters.map(CharacterConverter.convertToCell)
      self.currentPage += 1

      DispatchQueue.main.async {
        completionHandler()
      }
    })
  }

  func didSelect(row: Int) {
    router.show(character: characters[row])
  }
}
