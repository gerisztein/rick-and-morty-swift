//
//  CharacterViewModel.swift
//  RIck and Morty
//
//  Created by Alex Salom on 17/03/2020.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

final class CharacterDetailsViewModel {
  let character: CharacterDetailsViewState

  init(character: CharacterModel) {
    self.character = CharacterConverter.convertToDetails(from: character)
  }
}
