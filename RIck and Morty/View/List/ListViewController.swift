//
//  ListViewController.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel: ListViewModel!
  var characterList: [CharacterModel]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTableView()
    setupNavigation()
    loadData()
  }
  
  init(viewModel: ListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: "ListViewController", bundle: Bundle.main)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupNavigation() {
    title = "Rick and Morty"
    
    navigationItem.titleView?.tintColor = .black
  }
  
  func setupTableView() {
    tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    tableView.dataSource = self
    tableView.delegate = self
    tableView.prefetchDataSource = self
    tableView.rowHeight = 70
  }
  
  func loadData() {
    viewModel.getCharacterList {
      self.tableView.reloadData()
    }
  }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterTableViewCell
    
    let character = viewModel.dataSource[indexPath.row]
    cell.characterNameLabel.text = character.name
    cell.characterTypeLabel.text = character.type
    cell.characterImage.sd_setImage(with: character.imageUrl)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    viewModel.didSelect(row: indexPath.row)
  }
  
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
      print("load more")
      viewModel.getCharacterList {
        self.tableView.reloadData()
      }
    }
  }
}

private extension ListViewController {
  func isLoadingCell(for indexPath: IndexPath) -> Bool {
    return (indexPath.row) >= viewModel.dataSource.count - 1
  }
}
