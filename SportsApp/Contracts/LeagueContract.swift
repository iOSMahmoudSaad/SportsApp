//
//  LeagueContract.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 22/06/2022.
//

import Foundation

protocol IleagueView
{ // For League View
    func renderHomeView(leagues: [League])
    func postErrorLeagueView(error: Error)
}

protocol ILeaguePresenter
{  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(leagues: [League])
    func onFail(error: Error)
}

protocol IleagueModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
