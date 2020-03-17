//
//  CharacterViewController.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var speciesLabel: UILabel!
  @IBOutlet weak var genderLabel: UILabel!
  @IBOutlet weak var originLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  var character: CharacterModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }

  init(character: CharacterModel) {
    self.character = character
    super.init(nibName: "CharacterViewController", bundle: Bundle.main)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func updateUI() {
    nameLabel.text = character?.name
    statusLabel.text = character?.status
    speciesLabel.text = character?.species
    genderLabel.text = character?.gender
    originLabel.text = character?.origin?.name
    locationLabel.text = character?.location?.name
    imageView.sd_setImage(with: URL(string: character!.image), placeholderImage: UIImage(named: "placeholder"))
    
    navigationController?.navigationBar.tintColor = .white
  }

}
