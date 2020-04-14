//
//  RegisterViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 14/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var RegisterFbButton: UIButton!
    @IBOutlet weak var RegisterTwitterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
        RegisterFbButton.layer.borderWidth = 1
        RegisterFbButton.layer.borderColor = UIColor.gray.cgColor
        
        RegisterTwitterButton.layer.borderWidth = 1
        RegisterTwitterButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    

  
  

}
