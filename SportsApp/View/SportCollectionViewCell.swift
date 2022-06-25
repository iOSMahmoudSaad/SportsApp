//
//  SportCollectionViewCell.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 21/06/2022.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var sportLabel: UILabel!
    
     
}





extension UIImageView{
    func roundImgTable(){
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
    }
}
 
