//
//  HomePresenter.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import Foundation
class HomePresenter: IHomePresenter {
    
    let iHomeView: IHomeView
    
    init(iHomeView: IHomeView) {
        self.iHomeView = iHomeView
    }
    
    func fetchData(endPoint: String) {
        let homeModel = HomeModelController(iHomePresenter: self) // 2
        homeModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(users: [Sport]) {
        iHomeView.renderHomeView(users: users)
    }
    
    func onFail(error: Error) {
        iHomeView.postErrorHomeView(error: error)
    }
    
}
