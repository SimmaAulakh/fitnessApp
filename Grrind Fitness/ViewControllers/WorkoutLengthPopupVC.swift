//
//  WorkoutLengthPopupVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 26/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class WorkoutLengthPopupVC: UIViewController {

    @IBOutlet weak var BgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BgView.layer.cornerRadius = 20
        BgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    

}
