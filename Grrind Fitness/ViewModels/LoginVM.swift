//
//  LoginVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 10/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation

class LoginVM {
    
    //MARK:- Web service
    func loginUser(dataDic:NSMutableDictionary,completionHandler:@escaping()->()) {
        APIManager.shared.loginUser(request:dataDic) { (responseData) in
            let jsonDecoder = JSONDecoder()
            do {
                let responseModel = try jsonDecoder.decode(Register_Base.self, from: responseData)
                if responseModel.code == 200{
                
                    DataManager.shared.UserID = responseModel.data?.id?.toString() ?? ""
                    DataManager.shared.AuthToken = responseModel.data?.token ?? ""
                    DataManager.shared.UserName = responseModel.data?.name ?? ""
                completionHandler()
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? "")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension LoginVC{
    
    func checkValidations(){
          if emaitTF.isEmpty() || passwordTF.isEmpty(){
              HelpingVC.shared.showAlert(message: Constants.Alert_Messages.emptyField)
            
          }else if !emaitTF.isValidEmail(){
             HelpingVC.shared.showAlert(message: Constants.Alert_Messages.invalidEmail)
          }else{
              let req = Login.request(email: emaitTF.text, password: passwordTF.text)
              let paramDic = HelpingVC.shared.setBodyParams(request: req)
              viewObj.loginUser(dataDic: paramDic) {
                  DispatchQueue.main.async {
                      let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
                      self.navigationController?.pushViewController(vc!, animated: true)
                  }
              }
              
          }
      }
}
