//
//  AudioSettingsPopupVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AudioSettingsPopupVC: UIViewController {
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var viewBgView: UIView!
    @IBOutlet weak var view2BgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bgView.layer.cornerRadius = 20
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        viewBgView.layer.cornerRadius = 10
        viewBgView.layer.borderWidth = 1
        viewBgView.layer.borderColor = UIColor.gray.cgColor
        
        view2BgView.layer.cornerRadius = 10
        view2BgView.layer.borderWidth = 1
        view2BgView.layer.borderColor = UIColor.gray.cgColor
               
    }
    

   
}
