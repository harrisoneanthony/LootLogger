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
        if itemStore.allItems.contains(where: { $0.name == "No items" && $0.serialNumber == nil && $0.valueInDollars == 0 }) {
            itemStore.allItems.removeAll { $0.name == "No items" && $0.serialNumber == nil && $0.valueInDollars == 0 }
            tableView.reloadData()
        }
        
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            //Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // if you are currently in editing mode...
        if tableView.isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // turn off editing mode
            tableView.setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            tableView.setEditing(true, animated: true)
        }
    }
}

