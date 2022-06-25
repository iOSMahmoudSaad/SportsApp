//
//  FavouriteLeagueViewController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 24/06/2022.
//

import UIKit

class FavouriteLeagueViewController: UIViewController {
    
 
    var fave = [Leaguess]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
     @IBOutlet weak var FavouriteTable: UITableView!
    {
        didSet{
            FavouriteTable.delegate   = self
            FavouriteTable.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
       
    }
    

  
}
extension FavouriteLeagueViewController :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fave.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteViewCell
        cell.favouriteLeagueName.text = fave[indexPath.row].strLeague
        cell.favouriteImageLeaue.loadFromEvent(URLAddress: fave[indexPath.row].strBadge!)
        cell.favYoutube = fave[indexPath.row].strYoutube
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        let fet = DBManager.sharedInstance
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        fave = fet.fetchData(appDelegate: appDelegate)
        FavouriteTable.reloadData()
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Remove") { [self] Action, view, completionHandler in
            DBManager.sharedInstance.delete(league: fave[indexPath.row], indexPath: indexPath, appDelegate: self.appDelegate, delegate: self)
 
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
extension FavouriteLeagueViewController:DeletionDelegate
{
    func deleteMovieAtIndexPath(indexPath: IndexPath){
       fave.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.FavouriteTable.reloadData()
        }
    }
}
