//
//  RegisterVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 10/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class RegisterVM {
    //MARK:- Variables
    let dobPicker = UIDatePicker()
    
}

extension RegisterViewController{
    func checkValidations(){
        if emailTF.isEmpty() || passwordTF.isEmpty() || rePasswordTF.isEmpty() || firstNameTF.isEmpty() || lastNameTF.isEmpty() || dobTF.isEmpty() || countryTF.isEmpty() || cityTF.isEmpty(){
             HelpingVC.shared.showAlert(message: Constants.Alert_Messages.emptyField)
        }else if passwordTF.text != rePasswordTF.text{
             HelpingVC.shared.showAlert(message: Constants.Alert_Messages.passwordUnMatched)
        }else if !emailTF.isValidEmail(){
            HelpingVC.shared.showAlert(message: Constants.Alert_Messages.invalidEmail)
        }else{
            let req = Register.request(firstname: firstNameTF?.text, lastname: lastNameTF?.text, email: emailTF.text, password: passwordTF?.text, country: countryTF?.text, city: cityTF?.text, dob: dobTF?.text)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LiabilityReleaseVC") as? LiabilityReleaseVC
            vc?.registerData = req
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    func setUpView(){
        viewObj.dobPicker.addTarget(self, action: #selector(selectedDateAction(_ :)), for: .valueChanged)
        viewObj.dobPicker.maximumDate = Date()
        viewObj.dobPicker.datePickerMode = .date
        dobTF.inputView = viewObj.dobPicker
    }
}

