//
//  CharacterModel.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

struct CharacterModel: Decodable {
  let id: Int
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String
  let origin: LocationModel?
  let location: LocationModel?
  let image: String
  let episode: [String]
  let url: String
  let created: String
  
  init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: LocationModel?, location: LocationModel?, image: String, episode: [String], url: String, created: String) {
    
    self.id = id
    self.name = name
    self.status = status
    self.species = species
    self.type = type
    self.gender = gender
    self.image = image
    self.episode = episode
    self.url = url
    self.created = created
    self.origin = origin
    self.location = location
    
  }
}

struct LocationModel: Decodable {
  let name: String
  let url: String
}

struct Results: Decodable {
  let info: InfoModel
  let results: [CharacterModel]
}

struct InfoModel: Decodable {
  let count: Int
  let pages: Int
  let next: String?
  let previous: String?
}
