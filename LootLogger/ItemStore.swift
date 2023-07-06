//
//  ItemStore.swift
//  LootLogger
//
//  Created by Harrison Anthony on 6/27/23.
//

import UIKit

class ItemStore {
    var allItems = [[Item](), [Item]()]
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        newItem.valueInDollars <= 50 ? allItems[0].append(newItem) : allItems[1].append(newItem)
        return newItem
    }
    
    func removeItem(_ item: Item) {
        let section = item.valueInDollars <= 50 ? 0 : 1
        if let index = allItems[section].firstIndex(of: item) {
            allItems[section].remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        // get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // remove item from array
        allItems.remove(at: fromIndex)
        
        // insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
}


