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
    let viewModel = CharacterViewModel(character: character)
    let viewController = CharacterViewController(viewModel: viewModel)
    navigationController?.pushViewController(viewController, animated: true)
  }
}
