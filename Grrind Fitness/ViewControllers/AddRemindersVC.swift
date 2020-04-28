//
//  AddRemindersVC.swift
//  Grrind Fitness
//
//  Created by user on 27/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AddRemindersVC: UIViewController {
    
   
    @IBOutlet weak var reminderNameHeightConst: NSLayoutConstraint!
    @IBOutlet weak var repeatHeightConst: NSLayoutConstraint!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
     @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String,Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    @IBAction func reminderNameDownButton(_ sender: UIButton) {
        if sender.tag == 0{
            UIView.animate(withDuration: 0.5,animations:  {
                self.reminderNameHeightConst.constant = 200
            self.view.layoutIfNeeded()
            })
           
            sender.tag = 1
        }
        else{
            UIView.animate(withDuration: 0.5,animations:  {
                self.reminderNameHeightConst.constant = 56
                self.view.layoutIfNeeded()
                       })
            sender.tag = 0
        }
       
        
    }
    
    @IBAction func repeatDownButton(_ sender: UIButton) {
        if sender.tag == 0{
                   UIView.animate(withDuration: 0.5,animations:  {
                       self.repeatHeightConst.constant = 200
                   self.view.layoutIfNeeded()
                   })
                  
                   sender.tag = 1
               }
               else{
                   UIView.animate(withDuration: 0.5,animations:  {
                       self.repeatHeightConst.constant = 56
                       self.view.layoutIfNeeded()
                              })
                   sender.tag = 0
               }
            
    }
    @IBAction func didTapSaveButton(_ sender: Any) {
//        if let titleText = titleField.text, !titleText.isEmpty,
       // let bodyText = bodyField.text, !bodyText.isEmpty{
      //  let targetDate = datePicker.date
        
       // completion?(titleText,bodyText,targetDate)
//    }
   
        }
    }


