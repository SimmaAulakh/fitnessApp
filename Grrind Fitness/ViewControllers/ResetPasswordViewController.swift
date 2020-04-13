//
//  ResetPasswordViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 09/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
      override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            navigationController?.setNavigationBarHidden(true, animated: animated)
            
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
          
            navigationController?.setNavigationBarHidden(false   , animated: animated)
      }
    
    @IBAction func BackResetPassword(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
    }
    
   

}
