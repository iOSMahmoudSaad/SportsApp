//
//  Sport.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import Foundation
struct SportModel: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

 
