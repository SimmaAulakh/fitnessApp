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
    
    
    //MARK:- User defined functions
    ///Set up video player by loading video
    func setUpPlayer() -> AVPlayerLayer?{
        let moviePath = Bundle.main.path(forResource: "placeHolderPushUp", ofType: "mp4")
        if let path = moviePath {
            let url = NSURL.fileURL(withPath: path)
            self.player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: self.player)
           return playerLayer
        }
        return nil
    }
    
    func playVideo(){
        player.play()
    }
    
}

extension WorkoutVideoVC{
    func initVideoPlayer(){
        if let playerLayer = viewObj.setUpPlayer(){
            playerLayer.frame = videoView.bounds
            self.videoView.layer.addSublayer(playerLayer)
            viewObj.playVideo()
        }
    }
}
