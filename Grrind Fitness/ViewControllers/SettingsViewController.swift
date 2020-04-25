//
//  SettingsViewController.swift
//  Grrind Fitness
//
//  Created by user on 12/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet var settingstableView: UITableView!
     
    //MARK:- Variables
    let viewObj = SettingsVM()
    
    //MARK:- View life cycle
    override func viewDidLoad() {
           super.viewDidLoad()

        settingstableView.delegate = self
        settingstableView.dataSource = self
       }
    
    //MARK:- IBActions
    @IBAction func BackSettingsButton(_ sender: Any) {
      self.navigationController?.popViewController(animated: true)
        
    }
    
}

