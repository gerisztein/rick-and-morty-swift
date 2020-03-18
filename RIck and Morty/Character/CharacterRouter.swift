//
//  ListRouter.swift
//  RIck and Morty
//
//  Created by Alex Salom on 17/03/2020.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

final class CharacterRouter {
  private weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func show(character: CharacterModel) {
    let viewModel = CharacterDetailsViewModel(character: character)
    let viewController = CharacterDetailsViewController(viewModel: viewModel)
    
    navigationController?.pushViewController(viewController, animated: true)
  }
}
