//
//  TeamContract.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 25/06/2022.
//

import Foundation
protocol ITeamDetailView
{ // For League View
    func renderTeamDetailView(teamsDetail: [TeamDetail])
    func postErrorTeamDetailView(error: Error)
}

protocol ITeamDetailPresenter
{
    func fetchData(endPoint: String)
    func onSuccess(teamsDetail: [TeamDetail])
    func onFail(error: Error)
}

protocol ITeamDetailModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
