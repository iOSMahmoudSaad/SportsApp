//
//  JsonDecoder.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import Foundation
func convertFromJson<T: Codable>(data: Data) -> T? {
    let jsonDecoder = JSONDecoder()
    let decodedArray = try? jsonDecoder.decode(T.self, from: data)
    return decodedArray
}
