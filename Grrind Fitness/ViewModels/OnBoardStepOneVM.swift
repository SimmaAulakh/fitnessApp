//
//  OnBoardStepOneVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 10/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class OnBoardStepOneVM {
    
    //MARK:- Variables
    var registerData:Register.request?
    var measurementUnits = ["Kilograms","Pounds"]
    var weight = Array(20...500)
    var gender:String?
    
    //MARK:- API Requests
     func registerUser(dataDic:NSMutableDictionary,completionHandler:@escaping()->()) {
        APIManager.shared.registerUser(request: dataDic) { (responseData) in
            completionHandler()
        }
    }
}

extension OnBoardStepOneVC{
    //MARK:- User Defined functions
    func checkValidations(){
        if viewObj.gender == nil || measurementsTF.isEmpty() || weightTF.isEmpty() || heightTF.isEmpty(){
            HelpingVC.shared.showAlert(message: Constants.Alert_Messages.emptyField)
        }else{
            let req = Register.request(firstname: viewObj.registerData?.firstname, lastname: viewObj.registerData?.lastname, email: viewObj.registerData?.email, password: viewObj.registerData?.password, country: viewObj.registerData?.country, city: viewObj.registerData?.city, dob: viewObj.registerData?.dob, gender: viewObj.gender, weight: weightTF.text, height: heightTF.text)
            let dic = HelpingVC.shared.setBodyParams(request: req)
            viewObj.registerUser(dataDic: dic) {
                DispatchQueue.main.async {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardStepTwoVC") as? OnBoardStepTwoVC
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
        }
    }
    
    func addGestureRecogniser(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(maleViewTapped( _:)))
        tap.numberOfTapsRequired = 1
        maleBtnView.isUserInteractionEnabled = true
        maleBtnView.addGestureRecognizer(tap)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(femaleViewTapped( _:)))
        tap2.numberOfTapsRequired = 1
        femaleBtnView.isUserInteractionEnabled = true
        femaleBtnView.addGestureRecognizer(tap2)
    }
    
    func addPickerView(){
        let txtFields = [measurementsTF,weightTF,heightTF]
        for (i,txtField) in txtFields.enumerated(){
            let pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.tag = i
            txtField?.inputView = pickerView
        }
    }
    
    func selectGender(sender:Int){
        if sender == 1{
            maleBtnView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            femaleBtnView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            viewObj.gender = "male"
        }else{
            femaleBtnView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            maleBtnView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            viewObj.gender = "female"
        }
    }
}

extension OnBoardStepOneVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:return viewObj.measurementUnits.count
        case 1:return viewObj.weight.count
        case 2:return viewObj.weight.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:return viewObj.measurementUnits[row]
        case 1:return viewObj.weight[row].toString()
        case 2:return viewObj.weight[row].toString()
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: measurementsTF.text = viewObj.measurementUnits[row]
        case 1: weightTF.text = viewObj.weight[row].toString()
        case 2: heightTF.text = viewObj.weight[row].toString()
        default:break
        }
    }
}
