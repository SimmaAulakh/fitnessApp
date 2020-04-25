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
    
    //MARK:Variables
    let viewObj = WorkOutVideoVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideoPlayer()
    }
    

    
    // MARK: - IBAction

    @IBAction func playPauseBtnClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
    }
    

}
