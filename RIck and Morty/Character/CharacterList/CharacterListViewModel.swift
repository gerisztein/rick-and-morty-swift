//
//  CharacterViewModel.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

class CharacterListViewModel {

  private (set) var dataSource: [CharacterCellViewState] = []
  private var characters: [CharacterModel] = []
  private var currentPage = 1
  private let router: CharacterRouter
  private let networkManager: NetworkManager

  weak var view: CharacterListViewController?

  init(router: CharacterRouter, networkManager: NetworkManager = NetworkManager()) {
    self.router = router
    self.networkManager = networkManager
  }

  func viewDidLoad() {
    getCharacterList()
  }

  func prefetchRows(for indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
      getCharacterList()
    }
  }

  private func isLoadingCell(for indexPath: IndexPath) -> Bool {
    return (indexPath.row) >= dataSource.count - 1
  }

  private func getCharacterList() {
    networkManager.fetchData(page: currentPage, completionHandler: { characters in
      self.characters += characters
      self.dataSource += characters.map(CharacterConverter.convertToCell)
      self.currentPage += 1

      self.view?.reloadData()
    })
  }

  func didSelect(row: Int) {
    router.show(character: characters[row])
  }
}
