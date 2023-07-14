//
//  ViewController.swift
//  LootLogger
//
//  Created by Harrison Anthony on 6/27/23.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var itemStore: ItemStore!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        print("".isNotEmpty())
        print("ABC".isEqualABC)
        favoriteSwitch.isOn = false
    }
    
    @IBAction func favoriteSwitch(_ sender: UISwitch) {
        tableView.reloadData()
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            if favoriteSwitch.isOn {
                newItem.isFavorite = true
                newItem.name += "⭐"
            }
            //Insert this new row into the table
            tableView.insertRows(at:[indexPath], with: .automatic)
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

