//
//  FacebookRegisterViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 15/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class FacebookRegisterViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var ImageView: UIImageView!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ImageView.layer.borderWidth = 2
        ImageView.layer.borderColor = #colorLiteral(red: 0.2117647059, green: 0.8274509804, blue: 0.8823529412, alpha: 1).cgColor
    }
    

    //MARK:- IBActions
   
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func privacyPolicyBtnClicked(_ sender: Any) {
        self.pushToVC(vcID: "PrivacyPolicyVC")
    }
    
    @IBAction func termsAndConditionsBtnClicked(_ sender: Any) {
        self.pushToVC(vcID: "TermsOfUseVC")
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
    }
}
    


