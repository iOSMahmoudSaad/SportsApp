//
//  LeagueTableViewController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 22/06/2022.
//

import UIKit

class LeagueTableViewController: UIViewController {
    
   
    var leagues = [League]()
    
    
    @IBOutlet weak var leagueTable: UITableView!
    {
        didSet{
            
            leagueTable.delegate   = self
            leagueTable.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leaguePresenter: ILeaguePresenter = LeaguePresenter(iLeagueView: self) // 1
        leaguePresenter.fetchData(endPoint: "search_all_leagues.php?s=Soccer")
     }
    
}

 
extension LeagueTableViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leagueCell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueTableViewCell
        
        leagueCell.leagueLabel.text = leagues[indexPath.row].strLeague
        leagueCell.leagueImage.loadFromLeague(URLAddress: leagues[indexPath.row].strBadge!)
        leagueCell.youtube = leagues[indexPath.row].strYoutube
        leagueCell.layer.cornerRadius = 20
    
        return leagueCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetails = storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsViewController
        leagueDetails.cellSelect = leagues[indexPath.row].idLeague
        leagueDetails.LeagueNames  = leagues[indexPath.row].strLeague
        leagueDetails.LeagueImages = leagues[indexPath.row].strBadge
        leagueDetails.LeagueYoutubeButton = leagues[indexPath.row].strYoutube
        navigationController?.pushViewController(leagueDetails, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
extension LeagueTableViewController : IleagueView
{
    func renderHomeView(leagues: [League]) {
        self.leagues = leagues
        DispatchQueue.main.async {
            self.leagueTable.reloadData()
        }
    }
    
    func postErrorLeagueView(error: Error) {
        print(error.localizedDescription)

    }
    
    
}
extension UIImageView
{
  func loadFromLeague(URLAddress:String)
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
