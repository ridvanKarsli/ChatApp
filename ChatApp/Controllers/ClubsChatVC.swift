//
//  ClubsChatVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 18.02.2024.
//

import UIKit
import Firebase

class ClubsChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var clubChatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatText: UITextField!
    
    var clubChatArray = [Chat]()
    var selectedChildName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ChatCell", bundle: nil)
        clubChatTableView.register(nib, forCellReuseIdentifier: "CellID")
        
        clubChatTableView.dataSource = self
        clubChatTableView.delegate = self
        
        getMessage(childName: selectedChildName!)
    }
    
    
    @IBAction func SendBtnClicked(_ sender: UIButton) {
        chatText.endEditing(true)
        chatText.isEnabled = false
        sendButton.isEnabled = false
        if (chatText.text != ""){
            saveData(childName: selectedChildName!)
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
            self.clubChatArray.append(message)
            self.clubChatTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubChatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! ChatCellVC
        cell.userMessageText.text = clubChatArray[indexPath.row].messageBody
        cell.userNameText.text = clubChatArray[indexPath.row].sender
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
