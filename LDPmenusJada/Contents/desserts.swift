//
//  desserts.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 07/04/2022.
//

import Foundation
import UIKit

struct desserts {
    var name: String
    static func createDesserts() -> [desserts] {
        var dessertss: [desserts] = []
        let names = ContentManager.shared.desserts
        for i in 0..<names.count {
            let dessert = desserts(name: names[i])
            dessertss.append(dessert)
        }
        return dessertss
    }
    
}
