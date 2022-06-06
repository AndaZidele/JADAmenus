//
//  Category.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import Foundation
import UIKit

struct Category {
    
    var name: String
    var image: String
    
    static func createCategories() -> [Category] {
        var categories: [Category] = []
        let names = ContentManager.shared.categories
        let images = ContentManager.shared.categoriesImg
        
        for i in 0..<names.count {
            let category = Category(name: names[i], image: images[i])
            categories.append(category)
        }
        
        return categories
    }
    
}
