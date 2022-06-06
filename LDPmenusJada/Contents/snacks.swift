//
//  snacks.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 07/04/2022.
//

import Foundation
import UIKit

struct snacks {
    var name: String
    static func createSnacks() -> [snacks] {
        var snackss: [snacks] = []
        let names = ContentManager.shared.snacks
        for i in 0..<names.count {
            let snack = snacks(name: names[i])
            snackss.append(snack)
        }
        
        return snackss
    }
    
}
