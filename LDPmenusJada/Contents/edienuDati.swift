//
//  edienuDati.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 08/04/2022.
//

import Foundation
struct edienuDati: Hashable, Codable {
    var uid: String = UUID().uuidString
    var lietotEpasts: String
    var klasite: String
    var nosaukums: String
    var pagatIlgums: String
    var sarezgit: String
    var masSast: [String]
    var masStep: [String]
}
