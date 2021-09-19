//
//  ViewController.swift
//  MVVMTableView
//
//  Created by Decagon on 19/09/2021.
//

import UIKit

class TableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    cell.textLabel?.text = "SubTitle"
    cell.detailTextLabel?.text = "details"
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

}

