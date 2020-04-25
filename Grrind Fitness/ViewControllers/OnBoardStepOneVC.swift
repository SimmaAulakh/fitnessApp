//
//  OnBoardStepOneVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class OnBoardStepOneVC: UIViewController {

    //MARK:- IBOutlets
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBActions

    @IBAction func nextBtnClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardStepTwoVC") as? OnBoardStepTwoVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
