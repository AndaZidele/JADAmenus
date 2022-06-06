//
//  secondDishes.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 07/04/2022.
//

import Foundation
import UIKit

struct secondDishes {
    var name: String
    static func createSecond() -> [secondDishes] {
        var sDishes: [secondDishes] = []
        let names = ContentManager.shared.secondCourses
        for i in 0..<names.count {
            let sDishe = secondDishes(name: names[i])
            sDishes.append(sDishe)
        }
        return sDishes
    }
    
    
}
