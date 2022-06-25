//
//  TeamDetailViewController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 25/06/2022.
//

import UIKit
 
class TeamDetailViewController: UIViewController {
    
 var Detail = [TeamDetail]()
    
    var leagueNameDetail : String?
    var TeamImageDetail : String?
    var TeamYearDetail: String?
    var TeamStadiumDetail : String?
    var TeamNameDetail : String?


    @IBOutlet weak var LeagueDetailName: UILabel!
    @IBOutlet weak var LeagueImageDetail: UIImageView!
    @IBOutlet weak var TeamDetailName: UILabel!
    @IBOutlet weak var TeamDetailNameLabel: UILabel!
    @IBOutlet weak var TeamDetailYear: UILabel!
    @IBOutlet weak var TeamDetailYearLabel: UILabel!
    @IBOutlet weak var TeamDetailStadium: UILabel!
    @IBOutlet weak var TeamDetailStadiumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     
   
}
