//
//  ProfileVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 19.02.2024.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var userDepartmentText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signOutBtn(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toMainFromProfile", sender: nil)
        }catch{
            print("error")
        }
    }
}
