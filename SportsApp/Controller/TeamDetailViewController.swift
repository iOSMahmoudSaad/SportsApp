//
//  TeamDetailViewController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 25/06/2022.
//

import UIKit
 import SDWebImage
class TeamDetailViewController: UIViewController {
    
 var Detail = [TeamDetail]()
    
    var leagueName12 : String?
    var TeamImage12 : String?
    var TeamYear12: String?
    var TeamStadium12 : String?
    var TeamName12 : String?


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
        LeagueDetailName.text = leagueName12
        LeagueImageDetail.loadFromEvent(URLAddress: TeamImage12 ?? "")
        TeamDetailNameLabel.text = TeamName12
        TeamDetailYearLabel.text = TeamYear12
        TeamDetailStadiumLabel.text = TeamStadium12
                                     
    }
                                     
    }
    
 
     
   
 
 
