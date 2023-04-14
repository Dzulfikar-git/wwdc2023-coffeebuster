//
//  File.swift
//  
//
//  Created by Dzulfikar on 13/04/23.
//

import Foundation
struct CoffeeHistory: Codable {
    var history: [Date: [Coffee]]
    
    init() {
        history = [:]
    }
    
    mutating func addCoffee(_ coffeeItem: Coffee, for date: Date) {
        if history[date] == nil {
            history[date] = []
        }
        // Check if the coffee item already exists for the given date
        if !history[date]!.contains(where: { $0.id == coffeeItem.id }) {
            history[date]?.append(coffeeItem)
        }
    }
    
    func getCoffeeItems(for date: Date) -> [Coffee] {
        return history[date] ?? []
    }
}
