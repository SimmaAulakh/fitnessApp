//
//  AddRemindersVC.swift
//  Grrind Fitness
//
//  Created by user on 27/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AddRemindersVC: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
     @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String,Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        if let titleText = titleField.text, !titleText.isEmpty,
        let bodyText = bodyField.text, !bodyText.isEmpty{
        let targetDate = datePicker.date
        
        completion?(titleText,bodyText,targetDate)
    }
   
        }
    }


