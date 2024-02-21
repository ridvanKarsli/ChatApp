//
//  ClubsViewController.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 18.02.2024.
//

import UIKit

class ClubsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var clubsTableView: UITableView!
    
    var clubsArray = ["club1","club2","club3"]
    var clubsChildName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ClubsCell", bundle: nil)
        clubsTableView.register(nib, forCellReuseIdentifier: "CellID")

        clubsTableView.delegate = self
        clubsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! ClubsCellVC
        cell.clubsNameText.text = clubsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clubsChildName = clubsArray[indexPath.row]
        self.performSegue(withIdentifier: "toClubChatVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClubChatVC"{
            if let secondVC = segue.destination as? ClubsChatVC{
                secondVC.selectedChildName = clubsChildName
            }
        }
    }
    

    
     
}
