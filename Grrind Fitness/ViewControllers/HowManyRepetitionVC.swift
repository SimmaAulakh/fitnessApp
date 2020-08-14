//
//  HowManyRepetitionVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 04/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class HowManyRepetitionVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var upnextBtn: UIButton!
    @IBOutlet var repsTxtFields: [UITextField]!
    @IBOutlet weak var workoutTimeLbl: UILabel!
    
    //MARK:- Variables
    let viewObj = HowManyRepitionVM()

    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        upnextBtn.setTitle("NEXT UP: " + (viewObj.nextExercise ?? ""), for: .normal)
        for txtf in repsTxtFields{
            txtf.delegate = self
        }
        
        self.workoutTimeLbl.text = viewObj.workoutTime
    }
    

   //MARK:- IBActions

    @IBAction func nextExerciseBtnClicked(_ sender: Any) {
        if repsTxtFields[0].text != "" && repsTxtFields[1].text != ""{
             self.popVC()
        }else{
            self.showAlert(message: Constants.Alert_Messages.specifyNumberOfReps)
        }
       
    }
    
    @IBAction func audioBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AudioSettingsPopupVC") as? AudioSettingsPopupVC
              self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func timerBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutLengthPopupVC") as? WorkoutLengthPopupVC
        self.present(vc!, animated: true, completion: nil)
    }
}
