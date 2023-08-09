//
//  Item.swift
//  LootLogger
//
//  Created by Harrison Anthony on 6/27/23.
//

import UIKit

class Item: Equatable, Codable {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    let itemKey: String
    
    init(name: String, serialNumber: String?, valueInDollars: Int){
        // SILVER CHALLENGE: CHAPTER 10
        if name.count > 20 {
            // Adjust the character limit as needed
            // Truncate the name and add ellipsis
                let truncatedName = String(name.prefix(20)) + "..."
                self.name = truncatedName
        } else {
            self.name = name
        }
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            let randomAdjective = adjectives.randomElement()!
            let randomNouns = nouns.randomElement()!
            
            let randomName = "\(randomAdjective) \(randomNouns)"
            let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.serialNumber == rhs.serialNumber
        && lhs.valueInDollars == rhs.valueInDollars
        && lhs.dateCreated == rhs.dateCreated
    }
}
