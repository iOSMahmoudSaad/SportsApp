//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 23/06/2022.
//

import UIKit


class LeagueDetailsViewController: UIViewController{
    
    var cellSelect : String?
    var LeagueNames :String?
    var LeagueImages : String?
    var LeagueYoutubeButton :String?

    var upComingEvents = [Eventes]()
     var result = [Eventes]()
     var teamss = [Teams]()
 
    
    
    
    @IBOutlet weak var upComingLabel: UILabel!
    
    @IBOutlet weak var EventCollection: UICollectionView!
    {
        didSet{
             EventCollection.delegate   = self
             EventCollection.dataSource = self
        }
    }
 
    
    @IBOutlet weak var LastestLabel: UILabel!
    
    @IBOutlet weak var ResultTable: UITableView!
    {
            didSet{
                ResultTable.delegate   = self
                ResultTable.dataSource = self
            }
        }
 
    
    
    @IBOutlet weak var TeamCollection: UICollectionView!
    {
                didSet{
                     TeamCollection.delegate   = self
                     TeamCollection.dataSource = self
                }
           
    }
    
    
    @IBAction func FavouriteButton(_ sender: Any) {
        let db = DBManager.sharedInstance
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        db.addLeague(leagueTitle: LeagueNames ?? "", leagueImage: LeagueImages ?? "", leagueYoutube: LeagueYoutubeButton ?? "", appDelegate: appDelegate)
    }
    
   
    
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let EventPresenter: IEventPresenter = EventPresenter(iEventView: self) // 1
        EventPresenter.fetchData(endPoint: "eventsseason.php?id=\(cellSelect!)" )
        
        let ResultPresenter: IResultPresenter = ResultPresenter(iResultView: self) //1
        ResultPresenter.fetchData(endPoint: "eventsseason.php?id=\(cellSelect!)" )
       
        let TeamPresenter: ITeamPresenter = TeamPresenter(iTeamView: self)// 1
        TeamPresenter.fetchData(endPoint: "search_all_teams.php?l=English%20Premier%20League")

        
     }

}
extension LeagueDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == EventCollection){
            return upComingEvents.count
        }else if (collectionView == TeamCollection){
            return teamss.count
        }else{
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch(collectionView)
        {
        case EventCollection :
            let EventCell = EventCollection.dequeueReusableCell(withReuseIdentifier: "upComingEventCell", for: indexPath) as!UpComingCollectionViewCell
           
                               EventCell.Team1Label.text = upComingEvents[indexPath.row].strHomeTeam
                               EventCell.Team2Label.text = upComingEvents[indexPath.row].strAwayTeam
                               EventCell.DayLabel.text   = upComingEvents[indexPath.row].dateEvent
                               EventCell.TimeLabel.text  = upComingEvents[indexPath.row].strTime
           
           
                               return EventCell
         
     case TeamCollection :
            
            let TeamCell = TeamCollection.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCollectionViewCell
 
            TeamCell.TeamImage.loadFromEvent(URLAddress: teamss[indexPath.row].strTeamBadge!)
            
                                    return TeamCell
        default :
       
            let  Cell = TeamCollection.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCollectionViewCell
            return  Cell
        }
        
       
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let LeagueDetails = storyboard?.instantiateViewController(withIdentifier: "TeamDetailsVC") as!TeamDetailViewController
         LeagueDetails.leagueName12  = teamss[indexPath.row].strLeague
         LeagueDetails.TeamName12  = teamss[indexPath.row].strTeam
         LeagueDetails.TeamStadium12 = teamss[indexPath.row].strStadium
         LeagueDetails.TeamYear12 = teamss[indexPath.row].intFormedYear
         LeagueDetails.TeamImage12 = teamss[indexPath.row].strTeamBadge
         navigationController?.pushViewController(LeagueDetails, animated: true)
     }
}
extension LeagueDetailsViewController :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ResultCell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultTableViewCell

        ResultCell.FirstTeam.text    = result[indexPath.row].strHomeTeam
        ResultCell.SecondTeam.text   = result[indexPath.row].strAwayTeam
        ResultCell.resultFirst.text  = result[indexPath.row].intHomeScore
        ResultCell.resultSecond.text = result[indexPath.row].intAwayScore
        return ResultCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
extension LeagueDetailsViewController : IEventView
{
    func renderEventView(events: [Eventes]) {
        self.upComingEvents = events
        DispatchQueue.main.async {
            self.EventCollection.reloadData()
        }
    }
    
    func postErrorEventView(error: Error) {
        print(error.localizedDescription)
    }
     
     
    }
extension LeagueDetailsViewController:IResultView
{
    func renderResultView(Result: [Eventes]) {
        self.result = Result
        DispatchQueue.main.async {
            self.ResultTable.reloadData()
        }
    }
    func postErrorResultView(error: Error) {
        print(error.localizedDescription)

    }
}
 
extension LeagueDetailsViewController : ITeamView
{
    func renderTeamView(teams: [Teams]) {
        self.teamss = teams
        DispatchQueue.main.async {
            self.TeamCollection.reloadData()
        }
    }

    func postErrorTeamView(error: Error) {
        print(error.localizedDescription)
    }


    }
extension UIImageView
{
  func loadFromEvent(URLAddress:String)
   {
      guard let url = URL(string: URLAddress) else{
          return
      }
       DispatchQueue.main.async {[weak self] in
           if let imageData = try?Data(contentsOf: url){
               if let loadImage = UIImage(data: imageData){
                   self?.image = loadImage
               }
           }
       }
  }
}

