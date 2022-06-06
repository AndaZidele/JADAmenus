//
//  firstDishes.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 07/04/2022.
//

import Foundation
import UIKit

struct firstDishes {
    var name: String
    static func createFirst() -> [firstDishes] {
        var fDishes: [firstDishes] = []
        let names = ContentManager.shared.firstCourses
        for i in 0..<names.count {
            let fDishe = firstDishes(name: names[i])
            fDishes.append(fDishe)
        }
        
        return fDishes
    }
    
    
    
}
