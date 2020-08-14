//
//  AudioSettingsPopupVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AudioSettingsPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var viewBgView: UIView!
    @IBOutlet weak var view2BgView: UIView!
    @IBOutlet weak var audioCoachingSlider: UISlider!
    @IBOutlet weak var musicVolumeSlider: UISlider!
    @IBOutlet weak var volumeSwitch: UISwitch!
    
    //MARK:- Variables
    let viewObj = AudioSettingsPopUpVM()
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        audioCoachingSlider.value = Float(WorkoutDataManager.shared.volume)
        musicVolumeSlider.value = Float(WorkoutDataManager.shared.volume)
        volumeSwitch.isOn = WorkoutDataManager.shared.volume > 0 
        
    }
    
    //MARK:- IBActons
    @IBAction func dismissBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func audioCoachVolumeSliderAction(_ sender: UISlider) {
        WorkoutDataManager.shared.volume = sender.value
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AudioVolume"), object: nil, userInfo: ["vol" : sender.value])
    }
    
    @IBAction func musicVolumeSliderAction(_ sender: UISlider) {
        WorkoutDataManager.shared.volume = sender.value
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AudioVolume"), object: nil, userInfo: ["vol" : sender.value])
    }
    
    @IBAction func volumeSwitchAction(_ sender: UISwitch) {
        WorkoutDataManager.shared.volume = sender.isOn ? Float(0.5) : Float(0.0)
        audioCoachingSlider.value = Float(WorkoutDataManager.shared.volume)
        musicVolumeSlider.value = Float(WorkoutDataManager.shared.volume)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AudioVolume"), object: nil, userInfo: ["vol" : sender.isOn ? Float(0.5) : Float(0.0)])
        
    }
    
}
