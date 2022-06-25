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
    
    
    @IBAction func btnFavouriteYoutube(_ sender: UIButton) {
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         
    }

}
