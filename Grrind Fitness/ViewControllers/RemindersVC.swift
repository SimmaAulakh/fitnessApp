//
//  RemindersVC.swift
//  Grrind Fitness
//
//  Created by user on 27/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//
import UserNotifications
import UIKit

class RemindersVC: UIViewController {

   @IBOutlet weak var remindersTableView: UITableView!
    
   override func viewDidLoad() {
        super.viewDidLoad()

        remindersTableView.delegate = self
        remindersTableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
  
    @IBAction func editOrAddReminderAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddRemindersVC") as? AddRemindersVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction  func didTapTest(){
        
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
}

