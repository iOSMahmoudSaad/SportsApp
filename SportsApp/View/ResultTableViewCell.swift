//
//  ResultTableViewCell.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 23/06/2022.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var FirstTeam: UILabel!
    
    @IBOutlet weak var SecondTeam: UILabel!
    
    
    
  
    
    @IBOutlet weak var VsResult: UILabel!
    
   
    @IBOutlet weak var resultFirst: UILabel!
    
 
    @IBOutlet weak var ColonResult: UILabel!
    
   
    
    @IBOutlet weak var resultSecond: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
