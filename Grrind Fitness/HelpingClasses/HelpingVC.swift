//
//  HelpingVC.swift
//  Sorsr
//
//  Created by user on 31/03/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class HelpingVC: NSObject {
    
    //MARK:- Variables
    static let shared = HelpingVC()
   
    
    func delay(seconds:Double, completion: @escaping() -> Void ){
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //  let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    //Set body parameters for API's
    func setBodyParams(request:Any) -> NSMutableDictionary{
        //Initialize a NSMutableDictionary
          let dataDic = NSMutableDictionary()
        //Now
          let requestMirror = Mirror(reflecting: request)
          for child in requestMirror.children{
              dataDic.setValue(child.value, forKey: child.label!)
          }
         return dataDic
      }
    
 
    func showAlertWithCompletion(title:String,message:String, completionHandler: @escaping (_ status: Bool?) -> ()){
         DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            completionHandler(true)
        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        //            completionHandler(false)
        //        }
        alert.addAction(okAction)
        // alert.addAction(cancelAction)
        alert.show()
        //  self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithCompletionYesNo(title:String,message:String, completionHandler: @escaping (_ status: Bool?) -> ()){
          DispatchQueue.main.async {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
             completionHandler(true)
         }
                 let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                     completionHandler(false)
                 }
         alert.addAction(okAction)
          alert.addAction(cancelAction)
         alert.show()
         //  self.present(alert, animated: true, completion: nil)
         }
     }
    
    func showAlert(message:String){
        DispatchQueue.main.async {
            
        
        let alert = UIAlertController(title: Constants.AppInfo.APP_NAME, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        //
        //        }
        alert.addAction(okAction)
        // alert.addAction(cancelAction)
        alert.show()
        //self.present(alert, animated: true, completion: nil)
        }
    }
    
    func isInternetConnectionAvailable() -> Bool{
        let status = Reach().connectionStatus()
                switch status {
                case .unknown, .offline:
                    // Show alert if internet not available.
                  self.showAlert(message:Constants.Alert_Messages.noInternetConnection)
                    return false
                default:
                   return true
                  
                }
    }
    
    func resetRootVC(from:UIViewController,rootIdentifier:String){
        guard let rootVC = from.storyboard?.instantiateViewController(withIdentifier: rootIdentifier) else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
