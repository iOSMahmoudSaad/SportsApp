//
//  Events.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 23/06/2022.
//

import Foundation
struct EventsModel: Codable {
    let events: [Eventes]
    
}

struct Eventes: Codable {
    let strEvent: String?
    let dateEvent: String?
    let strTime: String?
    let strLeague: String?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let intHomeScore: String?
    let intAwayScore: String?
}
