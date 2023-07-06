//
//  ViewController.swift
//  LootLogger
//
//  Created by Harrison Anthony on 6/27/23.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        print("".isNotEmpty())
        print("ABC".isEqualABC)
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        let section = newItem.valueInDollars <= 50 ? 0 : 1
        if let index = itemStore.allItems[section].firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: section)
            
            //Insert this new row into the table
            self.tableView.insertRows(at:[indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // if you are currently in editing mode...
        if self.tableView.isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // turn off editing mode
            self.tableView.setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            self.tableView.setEditing(true, animated: true)
        }
    }
}

