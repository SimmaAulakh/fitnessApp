//
//  AccountInfoVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class AccountInfoVM {
    //MARK:- Variables
     var nameArray = ["Update Email","Update Password"]
}


extension AccountInfoViewController: UITableViewDataSource,UITableViewDelegate{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AccountInfoCell", for: indexPath) as? AccountInfoCell
        cell?.textlbl.text = viewObj.nameArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("1")
       }
}
    
  

