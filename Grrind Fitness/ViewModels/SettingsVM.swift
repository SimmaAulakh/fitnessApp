//
//  SettingsVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class SettingsVM {
    //MARK:- Variables
    var nameArray = ["Account Info" , "Workout Reminders", "Push Notifications", "Change Your Goals", "Invite Friends", "Rate the App","FAQ","Contact Us","Terms of Use","Privacy Policy","Log Out"
    ]
}

extension SettingsViewController{
    
    //MARK:- UserDefined Functions
   
}

extension SettingsViewController: UITableViewDataSource,UITableViewDelegate{
    
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
        
        switch section {
        case 1:
            return 6
            
        case 2:
            return 1
            
        default:
            return 4
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell
        
        cell?.settingSwitch.isHidden = indexPath == IndexPath(row: 2, section: 0) ? false : true
        
        cell?.accessoryType = indexPath == IndexPath(row: 2, section: 0) ? .none : .disclosureIndicator
        
        switch indexPath.section{
        case 1:
            cell?.titleLbl.text = viewObj.nameArray[indexPath.row + 4]
        case 2:
            cell?.titleLbl.text = viewObj.nameArray[indexPath.row + 10]
        default:
            cell?.titleLbl.text = viewObj.nameArray[indexPath.row]
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: self.pushToVC(vcID: "AccountInfoViewController")
            case 1:self.pushToVC(vcID: "RemindersVC")
            case 3:
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardStepTwoVC") as? OnBoardStepTwoVC
                vc?.viewObj.isFromSettings = true
                self.navigationController?.pushViewController(vc!, animated: true)
               
            default:
                break
            }
            
        case 1:
            switch indexPath.row {
           
            case 3: self.pushToVC(vcID: "ContactUsVC")
            case 4: self.pushToVC(vcID: "TermsOfUseVC")
            case 5: self.pushToVC(vcID: "PrivacyPolicyVC")
            default:break
            }
            
        case 2:
        switch indexPath.row {
        case 0:HelpingVC.shared.showAlertWithCompletionYesNo(title: Constants.AppInfo.APP_NAME, message: Constants.Alert_Messages.logoutUser) { (status) in
            if status!{
                DataManager.shared.UserID = ""
                HelpingVC.shared.resetRootVC(from: self, rootIdentifier: "LoginVC")
            }
            }
            
        default:break
            }
        default:break
        }
        
    }
    
  
}

