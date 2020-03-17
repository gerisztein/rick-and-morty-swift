//
//  CharacterViewModel.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

class ListViewModel {

  var characterList: [CharacterModel] = []
  private var currentPage = 1
  private let networkManager: NetworkManager

  init(networkManager: NetworkManager = NetworkManager()) {
    self.networkManager = networkManager
  }

  func getCharacterList(_ completionHandler: @escaping () -> Void) {
    networkManager.fetchData(page: currentPage, completionHandler: { characters in
      self.characterList.append(contentsOf: characters)
      self.currentPage += 1

      DispatchQueue.main.async {
        completionHandler()
      }
    })
  }

}
