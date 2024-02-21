//
//  SettingsVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 10.02.2024.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func signOutClicked(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toMainVC", sender: nil)
        }catch{
            print("error")
        }
    }
    
    
}
