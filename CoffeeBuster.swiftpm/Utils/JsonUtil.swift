//
//  JsonUtil.swift
//  
//
//  Created by Dzulfikar on 12/04/23.
//

import Foundation
struct JsonUtil {
    static func parseJsonCoffeeElement(jsonData: Data) -> [Coffee] {
        do {
            
            let decodedData = try JSONDecoder().decode([Coffee].self,
                                                       from: jsonData)
            
            return decodedData
        } catch {
            print("Decode Coffee Error")
        }
        return []
    }
    
    static func parseJsonCoffeeHistory(jsonData: Data) -> CoffeeHistory {
        do {
            let decodedData = try JSONDecoder().decode(CoffeeHistory.self, from: jsonData)
            
            return decodedData
        } catch {
            print("Decode Coffee History Error")
        }
        return .init()
    }
    
    static func encodeCoffeeHistory(data: CoffeeHistory) -> String {
        do {
            let encodedData = try JSONEncoder().encode(data)
            
            return String(data: encodedData, encoding: .utf8)!
        } catch {
            print("Encode Coffee History Error")
        }
        
        return ""
    }
}
