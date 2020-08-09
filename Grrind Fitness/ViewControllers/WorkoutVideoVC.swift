//
//  WorkoutVideoVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class WorkoutVideoVC: UIViewController {
    
    
    //MARk:- IBOutlets
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playPauseBtn: RoundButtonwithGradient1!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var workoutTitleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    //MARK:Variables
    let viewObj = WorkOutVideoVM()
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initVideoPlayer(index: viewObj.currentVideoIndex)
        workoutTitleLbl.text = viewObj.exercises[viewObj.currentVideoIndex].category
        self.startTimer()
    }
    
    
    // MARK: - IBAction
    @objc func timerAction(){
        viewObj.workoutDurationSec += 1
        //Save time for summary
        saveTimeForWorkout(category: viewObj.exercises[viewObj.currentVideoIndex].category)
        
       if WorkoutDataManager.shared.totalWorkoutLenght != viewObj.workoutDurationSec{
           timerLbl.text = HelpingVC.shared.timeFormatted(totalSeconds: Int(viewObj.workoutDurationSec))
        }else{
        self.viewObj.player.pause()
        self.stopTimer()
        self.viewObj.player = nil
        videoView.layer.sublayers = nil
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HowManyRepetitionVC") as? HowManyRepetitionVC
        vc?.viewObj.workoutTime = self.timerLbl.text
        self.navigationController?.pushViewController(vc!, animated: true)
        }
       }
    
    @IBAction func playPauseBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if self.viewObj.player.isPlaying{
            self.viewObj.player.pause()
            self.stopTimer()
        }else{
            self.viewObj.player.play()
            self.startTimer()
        }
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        self.viewObj.player.pause()
        self.stopTimer()
        self.viewObj.player = nil
        videoView.layer.sublayers = nil
        
        let req = SaveSummary.request(user_id: "4", date: "2020-08-07", type: "post", category: HelpingVC.shared.setBodyParams(request: Categorys(stretch: "10", cardio: "10", strength: "10")))
        let dataDic = HelpingVC.shared.setBodyParams(request: req)
        if (viewObj.currentVideoIndex + 1) == viewObj.exercises.count{
         
            
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutSummaryVC") as? WorkoutSummaryVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HowManyRepetitionVC") as? HowManyRepetitionVC
            viewObj.currentVideoIndex += 1
            vc?.viewObj.nextExercise = viewObj.exercises[viewObj.currentVideoIndex].exercise_name
            vc?.viewObj.workoutTime = self.timerLbl.text
            self.navigationController?.pushViewController(vc!, animated: true)
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
