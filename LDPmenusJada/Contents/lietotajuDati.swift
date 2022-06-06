//
//  lietotajuDati.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 07/04/2022.
//

import Foundation

struct lietotajaDati: Hashable, Codable {
    var uid: String = UUID().uuidString
    var email: String
    var password: String
    var name: String
    var surname: String
    var myRecipes: [String]
    
}
