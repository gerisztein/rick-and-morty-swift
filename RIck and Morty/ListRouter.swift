//
//  ListRouter.swift
//  RIck and Morty
//
//  Created by Alex Salom on 17/03/2020.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

final class ListRouter {
  private weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func show(character: CharacterModel) {
    let viewController = CharacterViewController(character: character)
    navigationController?.pushViewController(viewController, animated: true)
  }
}
