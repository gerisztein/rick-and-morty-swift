//
//  CharacterConverter.swift
//  RIck and Morty
//
//  Created by Alex Salom on 17/03/2020.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

struct CharacterCellViewState {
  let name: String
  let type: String
  let imageUrl: URL?
}

struct CharacterDetailsViewState {
  let name: String
  let status: String
  let species: String
  let gender: String
  let origin: String?
  let location: String?
  let imageUrl: URL?
}

final class CharacterConverter {
  static func convertToCell(from model: CharacterModel) -> CharacterCellViewState {
    let origin = model.origin?.name ?? "unknown location"
    let type = "\(model.species) from \(origin)"
    
    return CharacterCellViewState(name: model.name, type: type, imageUrl: URL(string: model.image))
  }

  static func convertToDetails(from model: CharacterModel) -> CharacterDetailsViewState {
    return CharacterDetailsViewState(name: model.name, status: model.status, species: model.species, gender: model.gender, origin: model.origin?.name, location: model.location?.name, imageUrl: URL(string: model.image))
  }
}
