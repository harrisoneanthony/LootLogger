//
//  ViewController.swift
//  LootLogger
//
//  Created by Harrison Anthony on 6/27/23.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var values = ["Harrison", "Steve", "Maddy"]
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let item = Item(true)
        
        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
}

