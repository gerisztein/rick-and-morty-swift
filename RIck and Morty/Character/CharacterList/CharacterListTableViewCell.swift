//
//  CharacterTableViewCell.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {
  
  @IBOutlet weak var characterNameLabel: UILabel!
  @IBOutlet weak var characterTypeLabel: UILabel!
  @IBOutlet weak var characterImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupImage()
  }
  
  func setupImage() {
    characterImage.layer.cornerRadius = characterImage.frame.height / 2
    characterImage.clipsToBounds = true
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
