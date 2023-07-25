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
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        
//        print("".isNotEmpty())
//        print("ABC".isEqualABC)
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            //Insert this new row into the table
            tableView.insertRows(at:[indexPath], with: .automatic)
        }
    }
    
//    @IBAction func toggleEditingMode(_ sender: UIButton) {
//        // if you are currently in editing mode...
//        if tableView.isEditing {
//            // Change text of button to inform user of state
//            sender.setTitle("Edit", for: .normal)
//
//            // turn off editing mode
//            tableView.setEditing(false, animated: true)
//        } else {
//            // Change text of button to inform user of state
//            sender.setTitle("Done", for: .normal)
//
//            // Enter editing mode
//            tableView.setEditing(true, animated: true)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem":
            // figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        // Takes care of toggling the button's title.
        super.setEditing(editing, animated: true)

        // Toggle table view editing.
        tableView.setEditing(editing, animated: true)
    }
}

