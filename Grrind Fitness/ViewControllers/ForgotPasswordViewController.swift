//
//  ForgotPasswordViewController.swift
//  Grrind Fitness
//
//  Created by user on 09/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.navigationBar.tintColor = .red
          
      }

      override func viewWillDisappear(_ animated: Bool) {
        
          super.viewWillDisappear(animated)
        
          navigationController?.setNavigationBarHidden(false   , animated: animated)
    }
    @IBAction func backforgotpassword(_ sender: Any) {
      
                      self.navigationController?.popViewController(animated: true)
    }
    @IBAction func ResetForgotpasswordButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as? ResetPasswordViewController
        
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func SignInbtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
               
                      self.navigationController?.popViewController(animated: true)
    }
    
}
