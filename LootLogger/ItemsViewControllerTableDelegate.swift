//
//  ViewController.swift
//  LootLogger
//
//  Created by Harrison Anthony on 6/27/23.
//

import UIKit

extension ItemsViewController {
    
    func setUpTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        if item.name == "No items!", item.serialNumber == nil, item.valueInDollars == 0 {
            cell.isUserInteractionEnabled = false
        } else {
            cell.isUserInteractionEnabled = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            // remove the item from the store
            itemStore.removeItem(item)
            
            // also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if itemStore.allItems.count == 0 {
                itemStore.allItems.append(Item(random: false))
                tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}

