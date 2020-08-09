//
//  HomeViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 13/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var reduceFatigueSwitch: UISwitch!
    @IBOutlet weak var increaseMobilitySwitch: UISwitch!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet var minuteTF: [UITextField]!
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    
    @IBOutlet weak var advancedBtn: UIButton!
    @IBOutlet weak var standrdBtn: UIButton!
    @IBOutlet weak var easyBtn: UIButton!
    
    //MARK:- Variables
    let viewObj = HomeVM()

    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
       
        for tf in minuteTF{
            tf.delegate = self
        }
        
        self.welcomeLbl.text = "Welcome back, \(DataManager.shared.UserName)!"
       
        let req = Exercises.request(type: "easy",id: DataManager.shared.UserID,workout_type:"pre")
                     let dataDic = HelpingVC.shared.setBodyParams(request: req)
                     viewObj.getExercises(dataDic: dataDic) {
                         
                     }
        
        let reqs = UserGoalsSelected.request(user_id: DataManager.shared.UserID)
        let dataDics = HelpingVC.shared.setBodyParams(request: reqs)
        viewObj.getUsersGoals(dataDic: dataDics) {
            DispatchQueue.main.async {
                self.goalsCollectionView.reloadData()
            }
        }
        
    }
    
    //MARK:- IBActions
    @IBAction func SettingsButtonClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func letsGoBtnClicked(_ sender: Any) {
        var minutes = ""
        for tf in minuteTF{
            minutes.append(tf.text ?? "")
            }
       
        if minutes != ""{
        WorkoutDataManager.shared.totalWorkoutLenght = (Int(minutes) ?? 0) * 60
       // self.pushToVC(vcID: "WorkoutVideoVC")
      
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutVideoVC") as? WorkoutVideoVC
        vc?.viewObj.exercises = viewObj.exercises
        self.navigationController?.pushViewController(vc!, animated: true)
            }
    }
    
    @IBAction func easyBtnClicked(_ sender: UIButton) {
        selectIntensity(intensity: "easy")
    }
    
    @IBAction func standardBtnClicked(_ sender: UIButton) {
        selectIntensity(intensity: "standard")
    }
    
    @IBAction func advancedBtnClicked(_ sender: UIButton) {
        selectIntensity(intensity: "advanced")
    }
    
}
