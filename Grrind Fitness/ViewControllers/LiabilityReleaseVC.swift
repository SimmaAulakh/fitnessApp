//
//  LiabilityReleaseVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 10/08/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class LiabilityReleaseVC: UIViewController {
        
    //MARK:- Variables
    var registerData:Register.request?
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- IBActions
    @IBAction func disagreeBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func agreeBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardStepOneVC") as? OnBoardStepOneVC
        vc?.viewObj.registerData = registerData
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
