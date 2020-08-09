//
//  OnBoardStepOneVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class OnBoardStepOneVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var femaleBtnView: UIView!
    @IBOutlet weak var maleBtnView: UIView!
    @IBOutlet weak var measurementsTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    
    //MARK:- Variables
    let viewObj = OnBoardStepOneVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addGestureRecogniser()
        addPickerView()
    }
    
    //MARK:- IBActions
    
    @objc func maleViewTapped(  _:UIGestureRecognizer){
        selectGender(sender:1)
    }
    
    @objc func femaleViewTapped(  _:UIGestureRecognizer){
         selectGender(sender:0)
       }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        
    }
    

    @IBAction func nextBtnClicked(_ sender: Any) {
        self.checkValidations()
   
    }
    
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
    
}
