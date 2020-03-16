//
//  CharacterViewModel.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

class ListViewModel {
  
  var networkManager = NetworkManager()
  var characterList: [CharacterModel] = [CharacterModel]()
  var currentPage = 1
  var currentCount: Int {
    return characterList.count
  }

  func getCharacterList(_ completionHandler: @escaping () -> Void) {
    networkManager.fetchData(page: currentPage, completionHandler: { (characters) in
      self.characterList.append(contentsOf: characters)
      self.currentPage += 1
      
      completionHandler()
    })
  }

}
