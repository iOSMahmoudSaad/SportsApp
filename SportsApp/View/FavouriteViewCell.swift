//
//  FavouriteViewCell.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 24/06/2022.
//

import UIKit

class FavouriteViewCell: UITableViewCell {
    
    
    @IBOutlet weak var favouriteImageLeaue: UIImageView!
    
    @IBOutlet weak var favouriteLeagueName: UILabel!
    
    var favYoutube :String?
    
    @IBAction func btnFavouriteYoutube(_ sender: UIButton) {
        if let url = URL(string: "https://\(favYoutube!)") {
                    UIApplication.shared.open(url, options: [:])
                }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         
    }

}
