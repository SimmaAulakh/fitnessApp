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
   
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var rePasswordTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    
    //MARK:- Variables
    let viewObj = RegisterVM()
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
//        RegisterFbButton.layer.borderWidth = 1
//        RegisterFbButton.layer.borderColor = UIColor.gray.cgColor
//
//        RegisterTwitterButton.layer.borderWidth = 1
//        RegisterTwitterButton.layer.borderColor = UIColor.gray.cgColor
        setUpView()
    }
    
    
    //MARK:- IBAction
    @objc func selectedDateAction(_ sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dobTF.text = formatter.string(from: sender.date)
    }
    
    @IBAction func RegisterBackBtn(_ sender: Any) {
         self.popVC()
    }
    
  
    @IBAction func nextBtnClicked(_ sender: Any) {
        self.checkValidations()
    }
    

}
