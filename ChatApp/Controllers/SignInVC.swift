//
//  SignInVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 10.02.2024.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButtonClicked(_ sender: UIButton) {
        if(emailTextField.text == "" || passwordTextField.text == ""){
            alertMessage(title: "ERROR", message: "Email or password is empty")
        }else{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
                if (error != nil){
                    self.alertMessage(title: "Error", message: error!.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "toMenuFromSignIn", sender: nil)
                }
            }
        }
    }
    
    @IBAction func donotHaveBtnClicked(_ sender: Any) {
    }
    
    func alertMessage(title : String ,message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default)
        alert.addAction(okBtn)
        present(alert,animated: true)
    }
    
}
