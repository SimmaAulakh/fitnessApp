//
//  WorkoutLengthPopupVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 26/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class WorkoutLengthPopupVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var BgView: UIView!
    
    @IBOutlet var minutesTxtFields: [UITextField]!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BgView.layer.cornerRadius = 20
        BgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.view.layoutIfNeeded()
        
        for txtf in minutesTxtFields{
            txtf.delegate = self
        }
       
        
       // self.view.viewWithTag(1)?.becomeFirstResponder()
    }
    
    //MARK:- IBActions
    @IBAction func dismissBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editingChangedTxtField(_ sender: UITextField) {
        if let nextTextField = self.view.viewWithTag(sender.tag + 1) {
            nextTextField.becomeFirstResponder()
        }
        
    }
    
    @IBAction func saveChangesBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        var customerIDString = ""
           self.minutesTxtFields.forEach { (singleCustomerIDTextField) in
               customerIDString.append(singleCustomerIDTextField.text!)
           }
           print(customerIDString)
    }
}
