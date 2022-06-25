//
//  HomeModelController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import Foundation
class HomeModelController: IHomeModel {
    
    let apiService: ApiServiceForHome = NetworkManagerForHome()
    let iHomePresenter: IHomePresenter
    
    init(iHomePresenter: IHomePresenter)  {
        self.iHomePresenter = iHomePresenter
    }
    
    func fetchDataFromApi(endPoint: String) {    // 3
        apiService.fetchSports(endPoint: endPoint) { users, error in
            if let users = users {
                self.iHomePresenter.onSuccess(users: users)
            }
            if let error = error {
                self.iHomePresenter.onFail(error: error)
            }
        }
    }
    
    
}
