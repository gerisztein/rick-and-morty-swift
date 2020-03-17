//
//  NetworkManager.swift
//  RIck and Morty
//
//  Created by Lucas Gerisztein on 10.03.20.
//  Copyright © 2020 Lucas Gerisztein. All rights reserved.
//

import Foundation

class NetworkManager {
  
  var hasNextPage: Bool = true
  
  func fetchData(page: Int, completionHandler: @escaping (_ response: [CharacterModel]) -> Void) {
    
    guard hasNextPage else { return }
    
    let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)")!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error fetching data. \(error)")
        
        return
      }
      
      if let data = data {
        let decoder = JSONDecoder()
        
        do {
          let results = try decoder.decode(Results.self, from: data)
          self.hasNextPage = results.info.next != ""

          DispatchQueue.main.async {
            completionHandler(results.results)
          }
        } catch {
          print("Error decoding data. \(error)")
        }
      }
    }
    
    task.resume()
  }
}
