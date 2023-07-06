//
//  String.swift
//  LootLogger
//
//  Created by Harrison Anthony on 7/5/23.
//

import Foundation

extension String {
    func isNotEmpty() -> Bool {
        return !self.isEmpty
    }
    
    var isEqualABC: Bool {
        return self == "ABC"
    }
}
