//
//  League.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 22/06/2022.
//

import Foundation
struct LeguesModel: Codable {
    let countries: [League]
    
}

struct League: Codable {
    let idLeague: String?
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
    let strBadge: String?
    let strYoutube: String?
}
