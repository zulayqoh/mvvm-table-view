//
//  ViewController.swift
//  MVVMTableView
//
//  Created by Decagon on 19/09/2021.
//

import UIKit

class TableViewController: UITableViewController {
  
  var users : [User] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUsers()
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    cell.textLabel?.text = "SubTitle"
    cell.detailTextLabel?.text = "details"
    
    return cell
  }
  
  private func fetchUsers() {
    APImanager.shared.fetchUsers { (result) in
      switch result {
      case .success(let users): self.users = users
      case .failure(let error): print(error.localizedDescription)
      }
    }
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

}

class APImanager {
  
  static let shared = APImanager()
  
  private init() {
    
  }
  
  func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
    
    let urlString = "https://jsonplaceholder.typicode.com/users"
    guard let url = URL(string: urlString) else {return}
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      guard let data = data else {
        fatalError("Data cannot be found")
      }
      
      do {
        let users = try JSONDecoder().decode([User].self, from: data)
      }
      catch(let error) {
        completion(.failure(error))
      }
    }.resume()
    
  }

  
}

struct User: Decodable {
  let id: Int
  let name: String
  let email: String
}

