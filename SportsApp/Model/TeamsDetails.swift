//
//  TeamsDetails.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 25/06/2022.
//

import Foundation
struct TeamsDeatailsModel: Codable {
    let teams: [TeamDetail]
    
}


struct TeamDetail: Codable {
    let strTeamBadge: String?
    let strTeam : String?
    let strLeague : String?
    let strStadium : String?
    let intFormedYear :String?
}
