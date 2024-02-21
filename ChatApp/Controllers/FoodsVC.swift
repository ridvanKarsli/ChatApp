//
//  FoodsVC.swift
//  ChatApp
//
//  Created by Rıdvan KARSLI on 12.02.2024.
//

import UIKit

class FoodsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var foodsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodsTableView.delegate = self
        foodsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        cell.imageView?.image = UIImage(named: "test")
        cell.detailTextLabel?.text = "0.0"
        return cell
    }
    
    
}
