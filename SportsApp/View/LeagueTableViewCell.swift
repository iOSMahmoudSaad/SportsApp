//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 22/06/2022.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueLabel: UILabel!
    var youtube:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnYoutubeLink(_ sender: Any) {
        if let url = URL(string: "https://\(youtube!)") {
                    UIApplication.shared.open(url, options: [:])
                }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
