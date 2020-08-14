//
//  AudioSettingsPopUpVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 14/08/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class AudioSettingsPopUpVM {
    
}

extension AudioSettingsPopupVC{
    
     func setUI(){
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
