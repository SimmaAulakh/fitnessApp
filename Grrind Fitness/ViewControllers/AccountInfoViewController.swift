//
//  AccountInfoViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 22/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController {
    
     var nameArray = ["Update Email","Update Password"]
    
    @IBOutlet weak var AccountInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AccountInfoTableView.delegate = self
        AccountInfoTableView.dataSource = self
        
        AccountInfoTableView.tableFooterView = UIView()
    }
    

    
}
extension AccountInfoViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("1")
        
    }
    
}
extension AccountInfoViewController: UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AccountInfoCell", for: indexPath) as? AccountInfoCell
        
        cell?.textlbl.text = nameArray[indexPath.row]
        
        return cell!
        
    }
}
    
  

