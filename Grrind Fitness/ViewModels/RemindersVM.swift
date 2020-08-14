//
//  RemindersVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 28/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class RemindersVM {
    
}

extension RemindersVC{
    
}

extension RemindersVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        remindersTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RemindersVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2//models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = remindersTableView.dequeueReusableCell(withIdentifier: "RemindersCell", for:indexPath) as? RemindersCell
      
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
        }
    }
}


