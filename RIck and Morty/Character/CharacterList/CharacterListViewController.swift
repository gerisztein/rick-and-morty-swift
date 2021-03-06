//
//  ListViewController.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 09.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let viewModel: CharacterListViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.viewDidLoad()
    
    setupTableView()
    setupNavigation()
  }
  
  init(viewModel: CharacterListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: "CharacterListViewController", bundle: Bundle.main)
    self.viewModel.view = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupNavigation() {
    title = "Rick and Morty"
    
    navigationItem.titleView?.tintColor = .black
//    self.view.backgroundColor = .white
  }
  
  func setupTableView() {
    tableView.register(UINib(nibName: "CharacterListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    tableView.dataSource = self
    tableView.delegate = self
    tableView.prefetchDataSource = self
    tableView.rowHeight = 80
    tableView.separatorStyle = .singleLine
    tableView.separatorColor = .lightGray
  }

  func reloadData() {
    tableView.reloadData()
  }
}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterListTableViewCell
    
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
    viewModel.prefetchRows(for: indexPaths)
  }
}
