//
//  RegisterViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 14/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var RegisterFbButton: UIButton!
    @IBOutlet weak var RegisterTwitterButton: UIButton!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        RegisterFbButton.layer.borderWidth = 1
        RegisterFbButton.layer.borderColor = UIColor.gray.cgColor
                
        RegisterTwitterButton.layer.borderWidth = 1
        RegisterTwitterButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    
    //MARK:- IBAction
    @IBAction func RegisterBackBtn(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
  
    @IBAction func nextBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardStepOneVC") as? OnBoardStepOneVC
                                
                                self.navigationController?.pushViewController(vc!, animated: true)
    }
    

}
