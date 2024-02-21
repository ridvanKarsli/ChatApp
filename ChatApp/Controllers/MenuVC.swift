//
//  MenuVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 10.02.2024.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var menuTableView: UITableView!
    
    var menuArray = ["FOODS","CLUBS"]
    var destinationArray = ["toFoodsVC","toClubsVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDestination = destinationArray[indexPath.row]
        self.performSegue(withIdentifier: selectedDestination, sender: nil)
    }
    
    
}
