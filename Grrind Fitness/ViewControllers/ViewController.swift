//
//  ViewController.swift
//  Grrind Fitness
//
//  Created by user on 08/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var BgImage1: UIImageView!
    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var SigninButton: UIButton!
    @IBOutlet weak var fbsigninbutton: UIButton!
    @IBOutlet weak var twittersigninbutton: UIButton!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        
        BgImage1.layer.cornerRadius = 20
        BgImage1.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        BgView.layer.borderWidth = 0.5
        BgView.layer.borderColor = UIColor.gray.cgColor
        
        fbsigninbutton.layer.borderWidth = 0.5
        fbsigninbutton.layer.borderColor = UIColor.gray.cgColor
        
        twittersigninbutton.layer.borderWidth = 0.5
        twittersigninbutton.layer.borderColor = UIColor.gray.cgColor
               
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
      
        navigationController?.setNavigationBarHidden(false   , animated: animated)

    }
    
    //MARK:- IBActions
    @IBAction func forgotPasswordBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
   
}

 
