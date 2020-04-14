//
//  SettingsViewController.swift
//  Grrind Fitness
//
//  Created by user on 12/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var nameArray = ["Account Info" , "Workout Reminders", "Push Notifications", "Change Your Goals", "Invite Friends", "Rate the App","FAQ","Contact Us","Terms of Use","Privacy Policy","Log Out"
    ]
    
    @IBOutlet var settingstableView: UITableView!
     
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
        settingstableView.delegate = self
        settingstableView.dataSource = self
        
        
       }
    
    @IBAction func BackSettingsButton(_ sender: Any) {
      self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension SettingsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
        
    }
    
}
extension SettingsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1
        {
             return "About Grrind Fitness"
        }
        else if section == 2
        {
            return " "
        }
        else
        {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1
        {
            return 6
        }
        else if section == 2
        {
            return 1
            
        }
        else
        {
            return 4
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell
        
        cell?.settingSwitch.isHidden = indexPath == IndexPath(row: 2, section: 0) ? false : true
        
        cell?.accessoryType = indexPath == IndexPath(row: 2, section: 0) ? .none : .disclosureIndicator
        
        if indexPath.section == 1
        {
            cell?.titleLbl.text = nameArray[indexPath.row + 4]
        }
        else if indexPath.section == 2
        {
             cell?.titleLbl.text = nameArray[indexPath.row + 10]
        }
        else
        {
             cell?.titleLbl.text = nameArray[indexPath.row]
        }
        return cell!
    }
}

