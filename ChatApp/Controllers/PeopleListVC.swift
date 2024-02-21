//
//  PeopleListVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 12.02.2024.
//

import UIKit
import Firebase

class PeopleListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var peopleTableView: UITableView!
    
    var peopleArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        //peopleTableView.register(UITableView.self, forCellReuseIdentifier: "CellID")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ""
        return cell
    }
    
    func getPeople(){

    }
}
