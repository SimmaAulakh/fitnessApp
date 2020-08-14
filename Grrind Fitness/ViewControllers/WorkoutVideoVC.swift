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
        self.setUpNotifications()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initVideoPlayer(index: viewObj.currentVideoIndex)
        playAudio(index: viewObj.currentVideoIndex)
        workoutTitleLbl.text = viewObj.exercises[viewObj.currentVideoIndex].category
        self.startTimer()
    }
    
    
    // MARK: - IBAction
    @objc func setVolume(_ noti:Notification){
        if let data = noti.userInfo {
            viewObj.player.volume = data["vol"] as! Float
        }
       
    }
    
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
        
        if (viewObj.currentVideoIndex + 1) == viewObj.exercises.count{
            let req = SaveSummary.request(user_id: DataManager.shared.UserID, date: Date().toString(dateFormat: "yyyy-MM-dd"), type: "post", category:HelpingVC.shared.jsonToString(json: HelpingVC.shared.setBodyParams(request: Categorys(stretch: "\(WorkoutDataManager.shared.myWorkoutData.streatchTime/60)", cardio: "\(WorkoutDataManager.shared.myWorkoutData.cardioTime/60)", strength: "\(WorkoutDataManager.shared.myWorkoutData.strengthTime/60)"))))
            let dataDic = HelpingVC.shared.setBodyParams(request: req)
            viewObj.saveSummary(request: dataDic) {
                DispatchQueue.main.async {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutSummaryVC") as? WorkoutSummaryVC
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
            
            
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
