//
//  ViewController.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import UIKit
import SDWebImage
 
class ViewController: UIViewController{
    var sports = [Sport]()
    let indicator = UIActivityIndicatorView(style: .large)

    @IBOutlet weak var myCollection: UICollectionView!
    {
        didSet{
            myCollection.delegate   = self
            myCollection.dataSource = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homePresenter: IHomePresenter = HomePresenter(iHomeView: self) // 1
        homePresenter.fetchData(endPoint: "all_sports.php")
      
     }

}


extension ViewController :UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate

{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath) as!SportCollectionViewCell
        
        sportCell.sportLabel.text = sports[indexPath.row].strSport
        sportCell.sportImage.loadFromSport(URLAddress: sports[indexPath.row].strSportThumb)
        sportCell.sportImage.roundImgTable()
        return sportCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200 , height:200)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 2, left: 2, bottom: 1, right: 2)
        }
    
   
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let LeagueVC = self.storyboard?.instantiateViewController(withIdentifier:"LeagueTableVC")
        as! LeagueTableViewController
 
         navigationController?.pushViewController(LeagueVC, animated: true)
    }

    
}
extension ViewController: IHomeView {
    
    func renderHomeView(users: [Sport]) {   //4
        self.sports = users
        DispatchQueue.main.async {
            self.myCollection.reloadData()
        }
    }
    func postErrorHomeView(error: Error) {
        print(error.localizedDescription)
    }
}
  
  extension UIImageView
{
    func loadFromSport(URLAddress:String)
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
 
