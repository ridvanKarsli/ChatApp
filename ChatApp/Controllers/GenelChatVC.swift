//
//  GenelChatVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 10.02.2024.
//

import UIKit
import Firebase

class GenelChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var typeChatTableView: UITableView!
    @IBOutlet weak var chatText: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var chatArray = [Chat]()
    var typeArray = ["Lessons","Accommodation","Foods","Animals"]
    var selectedChildName = "Lessons"
    
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ChatCell", bundle: nil)
        chatTableView.register(nib, forCellReuseIdentifier: "CellID")
        
        chatTableView.delegate = self
        chatTableView.dataSource = self

        typeChatTableView.delegate = self
        typeChatTableView.dataSource = self

        getMessage(childName: selectedChildName)
    }

    @IBAction func sendButtonClicked(_ sender: UIButton) {
        chatText.endEditing(true)
        chatText.isEnabled = false
        sendButton.isEnabled = false
        if (chatText.text != ""){
            saveData(childName: selectedChildName)
        }
    }
    
    func saveData (childName : String){
        let messageData = Database.database().reference().child(childName)
        let messageDictionaty = ["sender" : Auth.auth().currentUser?.email, "messageBody" : chatText.text!]
        
            messageData.childByAutoId().setValue(messageDictionaty, andPriority: .none) { error, reference in
            if (error != nil){
                print("error")
            }else{
                self.chatText.text = ""
                self.chatText.isEnabled = true
                self.sendButton.isEnabled = true
            }
        }
    }
    
    func getMessage(childName : String){
        let messageData = Database.database().reference().child(childName)
        messageData.observe(.childAdded) { snapShot in
            let value = snapShot.value as! Dictionary<String, String>
            let text = value["messageBody"]!
            let sender = value["sender"]!
            let message = Chat()
            message.messageBody = text
            message.sender = sender
            self.chatArray.append(message)
            self.chatTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRow = 0
        if tableView == chatTableView{
            numberOfRow = chatArray.count
        }else if tableView == typeChatTableView{
            numberOfRow = typeArray.count
        }
        return numberOfRow
         
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        if tableView == chatTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! ChatCellVC
            cell.userMessageText.text = chatArray[indexPath.row].messageBody
            cell.userNameText.text = chatArray[indexPath.row].sender
            return cell
        }else if tableView == typeChatTableView{
            cell.textLabel?.text = typeArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == typeChatTableView{
            chatArray.removeAll()
            chatTableView.reloadData()
            chatTableView.reloadData()
            selectedChildName = typeArray[indexPath.row]
            getMessage(childName: selectedChildName)
        }
    }
    
}
