//
//  TeamModelController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 25/06/2022.
//

import Foundation
class TeamDetailModelController: ITeamDetailModel {
   
   let apiService: ApiServiceForTeamDetail = NetworkManagerForTeamDetail()
   let iTeamDetailPresenter: ITeamDetailPresenter
   
   init(iTeamDetailPresenter: ITeamDetailPresenter)  {
       self.iTeamDetailPresenter = iTeamDetailPresenter
   }
   
   func fetchDataFromApi(endPoint: String) {    // 3
       apiService.fetchSports(endPoint: endPoint) { teamsDetail, error in
           if let TeamsDetail = teamsDetail {
               self.iTeamDetailPresenter.onSuccess(teamsDetail: TeamsDetail)
           }
           if let error = error {
               self.iTeamDetailPresenter.onFail(error: error)
           }
       }
   }
}
