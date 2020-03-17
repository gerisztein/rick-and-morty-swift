//
//  CharacterConverter.swift
//  RIck and Morty
//
//  Created by Alex Salom on 17/03/2020.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

struct CharacterCellViewModel {
  let name: String
  let type: String
  let imageUrl: URL?
}

final class CharacterConverter {
  static func convert(model: CharacterModel) -> CharacterCellViewModel {
    let type = "\(model.species) from \(model.origin?.name ?? "unknown location")"
    return CharacterCellViewModel(name: model.name, type: type, imageUrl: URL(string: model.image))
  }
}
