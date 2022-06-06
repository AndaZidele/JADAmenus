//
//  Class.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import Foundation
import UIKit

struct Class {
    
    var name: String
    
    static func createClasses() -> [Class] {
        var classes: [Class] = []
        let names = ContentManager.shared.classes
        
        for i in 0..<names.count {
            let classe = Class(name: names[i])
            classes.append(classe)
        }
        
        return classes
    }
    
}
