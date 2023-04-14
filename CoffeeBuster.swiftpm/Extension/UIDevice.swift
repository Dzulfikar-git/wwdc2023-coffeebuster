//
//  UIDevice.swift
//  CoffeeRandomizer
//
//  Created by Dzulfikar on 13/04/23.
//

import Foundation
import UIKit

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
