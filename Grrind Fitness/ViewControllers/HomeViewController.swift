//
//  HomeViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 13/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SettingsButtonClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
   
}
