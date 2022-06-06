//
//  drinks.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 07/04/2022.
//

import Foundation
import UIKit

struct drinks {
    var name: String
    static func createDrinks() -> [drinks] {
        var drinksis: [drinks] = []
        let names = ContentManager.shared.drinks
        for i in 0..<names.count {
            let drink = drinks(name: names[i])
            drinksis.append(drink)
        }
        return drinksis
        
    }
    
    
}
