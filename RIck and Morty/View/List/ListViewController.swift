//
//  ListViewController.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
  
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel: ListViewModel!
  var characterList: [CharacterModel]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    tableView.dataSource = self
    tableView.delegate = self
    tableView.prefetchDataSource = self
    tableView.rowHeight = 70
    title = "Rick and Morty"
    
    navigationItem.titleView?.tintColor = .black
    
    viewModel.getCharacterList {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  init(viewModel: ListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: "ListViewController", bundle: Bundle.main)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.characterList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterTableViewCell
    
    let character = viewModel.characterList[indexPath.row]
    cell.characterNameLabel.text = character.name
    cell.characterTypeLabel.text = "\(character.species) from \(character.origin?.name ?? "unknown location")"
    cell.characterImage.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: "placeholder"))
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let character = viewModel.characterList[indexPath.row]
    let viewController = CharacterViewController(character: character)
    
    tableView.deselectRow(at: indexPath, animated: true)
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
      viewModel.getCharacterList {
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }

}

private extension ListViewController {
  func isLoadingCell(for indexPath: IndexPath) -> Bool {
    return (indexPath.row) >= viewModel.currentCount - 1
  }

  func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
    let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
    let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
    
    return Array(indexPathsIntersection)
  }
}
