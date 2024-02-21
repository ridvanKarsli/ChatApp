//
//  SignUpVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 10.02.2024.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var departmanTextField: UITextField!
    @IBOutlet weak var profilePhotoImage: UIImageView!
    
    let db = Firestore.firestore()
    var isselectedImage = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //select profile photo
        profilePhotoImage.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickedImage))
        profilePhotoImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func clickedImage(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.profilePhotoImage.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        if (emailTextField.text == "" || passwordTextField.text == "" || nameTextField.text == "" || surnameTextField.text == "" || isselectedImage){
            if passwordTextField.text != passwordAgainTextField.text{
                alertMessage(title: "ERROR", message: "Passwords are not same")
            }
            alertMessage(title: "ERROR", message: "please enter all of text")
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
                if (error != nil){
                    self.alertMessage(title: "Error", message: error?.localizedDescription ?? "error")
                }else{
                    self.saveDataPerson()
                    self.performSegue(withIdentifier: "toMenuFromSignUp", sender: nil)
                }
            }
        }
    }
    
    func saveDataPerson(){
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        let department = departmanTextField.text!
        let email = emailTextField.text!
        let image = profilePhotoImage.image?.jpegData(compressionQuality: 0.5)!

        let dataToSave : [String : Any] = ["firstName" : name, "lastName" : surname, "department" : department, "email" : email, "profilePhoto" : image!]
        
        db.collection("Users").addDocument(data: dataToSave) { error in
            if error != nil{
                print("hatacık")
            }else{
                print("kaydedildicik")
            }
        }
    }
    
    @IBAction func HaveAccountClicked(_ sender: Any) {
        
    }
    
    func alertMessage(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
}
