//
//  WorkOutVideoVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class WorkOutVideoVM {
    //MARK:- Variables
    var player: AVPlayer!
    var exercises:[ExerciseData] = []
    var currentVideoIndex = 0
    var timer:Timer?
    var workoutDurationSec:Int = 0
    
    
    //MARK:- WebServices
    func saveSummary(request:NSMutableDictionary,completionHandler:@escaping()->()){
        APIManager.shared.saveGetSummary(request: request, requestType: HttpMethod.post) { (responseData) in
            completionHandler()
        }
    }
    
    
    //MARK:- User defined functions
    ///Set up video player by loading video
    func setUpPlayer(index:Int) -> AVPlayerLayer?{
        
        if let path = exercises[index].video_file,path != "" {
            let url = URL(string: path)
            self.player = AVPlayer(url: url!)
            let playerLayer = AVPlayerLayer(player: self.player)
            return playerLayer
        }else if let dropSet = exercises[index].dropset?.video_file,dropSet != ""{
            let url = URL(string: dropSet)
                       self.player = AVPlayer(url: url!)
                       let playerLayer = AVPlayerLayer(player: self.player)
                    return playerLayer
        }else {
           return setUpPlayer(index:index+1)
        }
    }
    
    func playVideo(){
        player.play()
    }
}

extension WorkoutVideoVC{
    func initVideoPlayer(index:Int){
        if let playerLayer = viewObj.setUpPlayer(index: index){
            DispatchQueue.main.async {
                playerLayer.frame = CGRect(x: 0, y: 0, width: self.videoView.frame.width, height: self.videoView.frame.height)
                playerLayer.videoGravity = .resizeAspect
                self.videoView.layer.addSublayer(playerLayer)
                self.viewObj.playVideo()
            }
        }
//        else{
//            self.viewObj.playVideo()
//        }
        
        //play video in loop until user is done with exercise
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.viewObj.player.currentItem, queue: .main) { [weak self] _ in
            self?.viewObj.player?.seek(to: CMTime.zero)
            self?.viewObj.player?.play()
        }
    }
    
    func startTimer(){
         viewObj.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        viewObj.timer?.invalidate()
    }
    
    func saveTimeForWorkout(category:String?){
        switch category {
        case "strength":
            WorkoutDataManager.shared.myWorkoutData.strengthTime += 1
        case "cardio":
            WorkoutDataManager.shared.myWorkoutData.cardioTime += 1
        case "stretching":
            WorkoutDataManager.shared.myWorkoutData.streatchTime += 1
        default:
            break
        }
    }
}
