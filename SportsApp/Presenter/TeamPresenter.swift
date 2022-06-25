//
//  TeamPresenter.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 25/06/2022.
//

import Foundation
class TeamDetailPresenter: ITeamDetailPresenter {
  
   
    let iTeamDetailView: ITeamDetailView
    
    init(iTeamDetailView: ITeamDetailView) {
        self.iTeamDetailView = iTeamDetailView
    }
    
    func fetchData(endPoint: String) {
        let TeamDetailModel = TeamDetailModelController(iTeamDetailPresenter: self)// 2
        TeamDetailModel.fetchDataFromApi(endPoint: endPoint)
    }
    func onSuccess(teamsDetail: [TeamDetail])
    {
        iTeamDetailView.renderTeamDetailView(teamsDetail:teamsDetail)
    }
    func onFail(error: Error)
    {
        iTeamDetailView.postErrorTeamDetailView(error: error)
    }
}
