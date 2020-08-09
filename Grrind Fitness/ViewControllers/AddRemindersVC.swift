//
//  AddRemindersVC.swift
//  Grrind Fitness
//
//  Created by user on 27/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AddRemindersVC: UIViewController {
    
   
    @IBOutlet weak var saturdaybtn: UIButton!
    @IBOutlet weak var fridayBtn: UIButton!
    @IBOutlet weak var thursdayBtn: UIButton!
    @IBOutlet weak var wednesdayBtn: UIButton!
    @IBOutlet weak var tuesdayBtn: UIButton!
    @IBOutlet weak var mondayBtn: UIButton!
    @IBOutlet weak var sundayBtn: UIButton!
    @IBOutlet weak var reminderNameHeightConst: NSLayoutConstraint!
    @IBOutlet weak var repeatHeightConst: NSLayoutConstraint!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
     @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String,Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.datePickerMode = .time
        
        
        
        self.reminderNameHeightConst.constant = 56
          self.repeatHeightConst.constant = 56
    }
    @IBAction func saturdayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    @IBAction func fridayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    @IBAction func thursdayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    @IBAction func wednesdayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    @IBAction func tuesdayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    @IBAction func mondayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    @IBAction func sundayBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.2470588235, green: 0.7647058824, blue: 0.9568627451, alpha: 1) : UIColor.white
    }
    
    
    @IBAction func reminderNameDownButton(_ sender: UIButton) {
        if sender.tag == 0{
            UIView.animate(withDuration: 0.5,animations:  {
                self.reminderNameHeightConst.constant = 130
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
                       self.repeatHeightConst.constant = 130
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
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        self.popVC()
    }
    
    }


