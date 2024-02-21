//
//  ClubsCellVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 18.02.2024.
//

import UIKit

class ClubsCellVC: UITableViewCell {
    
    @IBOutlet weak var clubsImage: UIImageView!
    
    @IBOutlet weak var clubsNameText: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
