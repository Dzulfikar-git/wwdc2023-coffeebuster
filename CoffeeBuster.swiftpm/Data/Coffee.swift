//
//  Coffee.swift
//  CoffeeSpinner
//
//  Created by Dzulfikar on 07/04/23.
//

import Foundation
import CoreData

struct Coffee: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
    var isSelected: Bool = false
    
    static let coffeeJson = """
        [
          {
            "id": 1,
            "name": "Iced Coffee",
            "isSelected": false
          },
          {
            "id": 2,
            "name": "Iced Coffee with Milk",
            "isSelected": false
          },
          {
            "id": 3,
            "name": "Iced Coffee with Classic Syrup",
            "isSelected": false
          },
          {
            "id": 4,
            "name": "Iced Coffee with Milk and Classic Syrup",
            "isSelected": false
          },
          {
            "id": 5,
            "name": "Iced Coffee with Hazelnut Syrup",
            "isSelected": false
          },
          {
            "id": 6,
            "name": "Iced Coffee with Milk and Hazelnut Syrup",
            "isSelected": false
          },
          {
            "id": 7,
            "name": "Iced Coffee with Caramel Syrup",
            "isSelected": false
          },
          {
            "id": 8,
            "name": "Iced Coffee with Milk and Caramel Syrup",
            "isSelected": false
          },
          {
            "id": 9,
            "name": "Iced Coffee with Vanilla Syrup",
            "isSelected": false
          },
          {
            "id": 10,
            "name": "Iced Coffee with Milk and Vanilla Syrup",
            "isSelected": false
          },
          {
            "id": 11,
            "name": "Iced Coffee with Sugar-Free Vanilla Syrup",
            "isSelected": false
          },
          {
            "id": 12,
            "name": "Iced Coffee with Milk and Sugar-Free Vanilla Syrup",
            "isSelected": false
          },
          {
            "id": 13,
            "name": "Caramel Macchiato",
            "isSelected": false
          },
          {
            "id": 14,
            "name": "Caramel Macchiato Frappuccino",
            "isSelected": false
          },
          {
            "id": 15,
            "name": "Caramel Macchiato with Almond Milk",
            "isSelected": false
          },
          {
            "id": 16,
            "name": "Caramel Macchiato with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 17,
            "name": "Caramel Macchiato with Soy Milk",
            "isSelected": false
          },
          {
            "id": 18,
            "name": "Cinnamon Dolce Latte",
            "isSelected": false
          },
          {
            "id": 19,
            "name": "Cinnamon Dolce Latte Macchiato",
            "isSelected": false
          },
          {
            "id": 20,
            "name": "Cinnamon Dolce Creme",
            "isSelected": false
          },
          {
            "id": 21,
            "name": "Coconut Milk Latte",
            "isSelected": false
          },
          {
            "id": 22,
            "name": "Honey Almondmilk Flat White",
            "isSelected": false
          },
          {
            "id": 23,
            "name": "Honey Latte",
            "isSelected": false
          },
          {
            "id": 24,
            "name": "Oatmilk Honey Latte",
            "isSelected": false
          },
          {
            "id": 25,
            "name": "Oatmilk Latte",
            "isSelected": false
          },
          {
            "id": 26,
            "name": "Almond Milk Honey Flat White",
            "isSelected": false
          },
          {
            "id": 27,
            "name": "Almond Milk Honey Flat White with Espresso",
            "isSelected": false
          },
          {
            "id": 28,
            "name": "Almond Milk Latte",
            "isSelected": false
          },
          {
            "id": 29,
            "name": "Almond Milk Latte Macchiato",
            "isSelected": false
          },
          {
            "id": 30,
            "name": "Caffe Americano",
            "isSelected": false
          },
          {
            "id": 31,
            "name": "Caffe Latte",
            "isSelected": false
          },
          {
            "id": 32,
            "name": "Caffe Misto",
            "isSelected": false
          },
          {
            "id": 33,
            "name": "Cappuccino",
            "isSelected": false
          },
          {
            "id": 34,
            "name": "Espresso",
            "isSelected": false
          },
          {
            "id": 35,
            "name": "Espresso Macchiato",
            "isSelected": false
          },
          {
            "id": 36,
            "name": "Flat White",
            "isSelected": false
          },
          {
            "id": 37,
            "name": "Latte Macchiato",
            "isSelected": false
          },
          {
            "id": 38,
            "name": "Red Eye",
            "isSelected": false
          },
          {
            "id": 39,
            "name": "Toasted Caramel Brulee Cold Brew",
            "isSelected": false
          },
          {
            "id": 40,
            "name": "Toasted Caramel Brulee Cold Foam",
            "isSelected": false
          },
          {
            "id": 41,
            "name": "Vanilla Latte",
            "isSelected": false
          },
          {
            "id": 42,
            "name": "Vanilla Latte Macchiato",
            "isSelected": false
          },
          {
            "id": 43,
            "name": "White Chocolate Mocha",
            "isSelected": false
          },
          {
            "id": 44,
            "name": "White Chocolate Mocha Frappuccino",
            "isSelected": false
          },
          {
            "id": 45,
            "name": "White Chocolate Mocha with Almond Milk",
            "isSelected": false
          },
          {
            "id": 46,
            "name": "White Chocolate Mocha with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 47,
            "name": "White Chocolate Mocha with Soy Milk",
            "isSelected": false
          },
          {
            "id": 48,
            "name": "Iced Caffe Americano",
            "isSelected": false
          },
          {
            "id": 49,
            "name": "Iced Caffe Latte",
            "isSelected": false
          },
          {
            "id": 50,
            "name": "Iced Caffe Mocha",
            "isSelected": false
          },
          {
            "id": 51,
            "name": "Iced Caramel Cloud Macchiato",
            "isSelected": false
          },
          {
            "id": 52,
            "name": "Iced Caramel Macchiato",
            "isSelected": false
          },
          {
            "id": 53,
            "name": "Iced Coconutmilk Mocha Macchiato",
            "isSelected": false
          },
          {
            "id": 54,
            "name": "Iced White Chocolate Mocha",
            "isSelected": false
          },
          {
            "id": 55,
            "name": "Java Chip Frappuccino",
            "isSelected": false
          },
          {
            "id": 56,
            "name": "Java Chip Frappuccino with Almond Milk",
            "isSelected": false
          },
          {
            "id": 57,
            "name": "Java Chip Frappuccino with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 58,
            "name": "Java Chip Frappuccino with Soy Milk",
            "isSelected": false
          },
          {
            "id": 59,
            "name": "Mocha Cookie Crumble Frappuccino",
            "isSelected": false
          },
          {
            "id": 60,
            "name": "Mocha Frappuccino",
            "isSelected": false
          },
          {
            "id": 61,
            "name": "Mocha Frappuccino with Almond Milk",
            "isSelected": false
          },
          {
            "id": 62,
            "name": "Mocha Frappuccino with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 63,
            "name": "Mocha Frappuccino with Soy Milk",
            "isSelected": false
          },
          {
            "id": 64,
            "name": "Peppermint Mocha",
            "isSelected": false
          },
          {
            "id": 65,
            "name": "Peppermint Mocha Frappuccino",
            "isSelected": false
          },
          {
            "id": 66,
            "name": "Salted Caramel Cream Cold Brew",
            "isSelected": false
          },
          {
            "id": 67,
            "name": "Salted Caramel Cream Nitro Cold Brew",
            "isSelected": false
          },
          {
            "id": 68,
            "name": "Toasted White Chocolate Mocha",
            "isSelected": false
          },
          {
            "id": 69,
            "name": "Toasted White Chocolate Mocha Frappuccino",
            "isSelected": false
          },
          {
            "id": 72,
            "name": "Caffe Mocha",
            "isSelected": false
          },
          {
            "id": 73,
            "name": "Caffe Mocha with Almond Milk",
            "isSelected": false
          },
          {
            "id": 74,
            "name": "Caffe Mocha with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 75,
            "name": "Caffe Mocha with Soy Milk",
            "isSelected": false
          },
          {
            "id": 76,
            "name": "Caffe Vanilla Frappuccino",
            "isSelected": false
          },
          {
            "id": 77,
            "name": "Caffe Vanilla Frappuccino with Almond Milk",
            "isSelected": false
          },
          {
            "id": 78,
            "name": "Caffe Vanilla Frappuccino with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 79,
            "name": "Caffe Vanilla Frappuccino with Soy Milk",
            "isSelected": false
          },
          {
            "id": 80,
            "name": "Caramel Apple Spice",
            "isSelected": false
          },
          {
            "id": 81,
            "name": "Caramel Brulee Latte",
            "isSelected": false
          },
          {
            "id": 82,
            "name": "Caramel Brulee Latte Macchiato",
            "isSelected": false
          },
          {
            "id": 83,
            "name": "Caramel Brulee Frappuccino",
            "isSelected": false
          },
          {
            "id": 84,
            "name": "Caramel Flan Latte",
            "isSelected": false
          },
          {
            "id": 85,
            "name": "Caramel Frappuccino",
            "isSelected": false
          },
          {
            "id": 86,
            "name": "Caramel Frappuccino with Almond Milk",
            "isSelected": false
          },
          {
            "id": 87,
            "name": "Caramel Frappuccino with Coconut Milk",
            "isSelected": false
          },
          {
            "id": 88,
            "name": "Caramel Frappuccino with Soy Milk",
            "isSelected": false
          },
          {
            "id": 89,
            "name": "Caramel Latte",
            "isSelected": false
          },
          {
            "id": 91,
            "name": "Chestnut Praline Latte",
            "isSelected": false
          },
          {
            "id": 92,
            "name": "Chestnut Praline Latte Macchiato",
            "isSelected": false
          },
          {
            "id": 93,
            "name": "Chile Mocha",
            "isSelected": false
          },
          {
            "id": 94,
            "name": "Chile Mocha Frappuccino",
            "isSelected": false
          },
          {
            "id": 98,
            "name": "Cold Brew",
            "isSelected": false
          },
          {
            "id": 99,
            "name": "Cold Brew with Cinnamon Almond Milk Foam",
            "isSelected": false
          },
          {
            "id": 100,
            "name": "Cold Brew with Cinnamon Oat Milk Foam",
            "isSelected": false
          },
          {
            "id": 101,
            "name": "Cold Brew with Dark Cocoa Almond Milk Foam",
            "isSelected": false
          },
          {
            "id": 102,
            "name": "Cold Brew with Dark Cocoa Oat Milk Foam",
            "isSelected": false
          },
          {
            "id": 104,
            "name": "Espresso Con Panna",
            "isSelected": false
          },
          {
            "id": 107,
            "name": "Gingerbread Latte",
            "isSelected": false
          },
          {
            "id": 108,
            "name": "Gingerbread Latte Macchiato",
            "isSelected": false
          }
        ]
    """
}

struct CoffeeElement: Codable {
    let id: Int
    let name: String
    var isSelected: Bool = false
}
