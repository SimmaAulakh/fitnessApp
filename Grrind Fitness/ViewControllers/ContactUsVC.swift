//
//  ContactUsVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class ContactUsVC: UIViewController {
    
    //MARK:- IBOutlets
    
    //MARK:- Variables
    let viewObj = ContactUsVM()

    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBActions
    
    @IBAction func submitBtnClicked(_ sender: Any) {
    }
    
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
    
    
}
