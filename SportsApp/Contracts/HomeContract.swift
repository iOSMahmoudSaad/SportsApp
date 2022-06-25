//
//  HomeContract.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import Foundation

//Home Screen
protocol IHomeView
{ // For home View
    func renderHomeView(users: [Sport])
    func postErrorHomeView(error: Error)
}

protocol IHomePresenter
{  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(users: [Sport])
    func onFail(error: Error)
}

protocol IHomeModel { // For Model
    func fetchDataFromApi(endPoint: String)
}


// League Screen
