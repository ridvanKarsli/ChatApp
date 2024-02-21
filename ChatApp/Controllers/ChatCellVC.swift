//
//  ChatCellVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 11.02.2024.
//

import UIKit

class ChatCellVC: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var userMessageText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
