//
//  OnBoardStepThreeVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class OnBoardStepThreeVC: UIViewController {
    
    //MARK:- IBOutlets
    //Ideal body type
    @IBOutlet weak var toneLeanBtn: UIButton!
    @IBOutlet weak var slimBtn: UIButton!
    @IBOutlet weak var fitMuscularBtn: UIButton!
    @IBOutlet weak var hourglassBtn: UIButton!
    @IBOutlet weak var selfImprovementBtn: UIButton!
    @IBOutlet weak var healthConcernBtn: UIButton!
    @IBOutlet weak var stressReleiefBtn: UIButton!
    @IBOutlet weak var weightLossBtn: UIButton!
    @IBOutlet weak var needExerciseBtn: UIButton!
    @IBOutlet weak var daysSlider: UISlider!
    @IBOutlet weak var minutesTF1: UITextField!
    @IBOutlet weak var minutesTF2: UITextField!
    
    //MARK:- Variables
    let viewObj = OnBoardStepThreeVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- IBActions
    @IBAction func idealBodyBtnClicked(_ sender: UIButton) {
        switch sender.tag {
        case 0:setIdealBody(sender: 0)
        case 1:setIdealBody(sender: 1)
        case 2:setIdealBody(sender: 2)
        case 3:setIdealBody(sender: 3)
        default:break
        }
    }
    
    @IBAction func whyDecidedForWrkoutBtnsClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        switch sender.tag {
        case 0:setWhyDecidedForWorkout(sender: sender)
        case 1:setWhyDecidedForWorkout(sender: sender)
        case 2:setWhyDecidedForWorkout(sender: sender)
        case 3:setWhyDecidedForWorkout(sender: sender)
        case 4:setWhyDecidedForWorkout(sender: sender)
        default:break
        }
    }
    
    @IBAction func daysSliderAction(_ sender: UISlider) {
    
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
    
}
