//
//  OnBoardStepTwoVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 25/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class OnBoardStepTwoVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    @IBOutlet weak var begnnerBtn: UIButton!
    @IBOutlet weak var expertBtn: UIButton!
    @IBOutlet weak var intermediateBtn: UIButton!
    @IBOutlet weak var goalsCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLbl: UILabel!
    
    //MARK:- Variables
    let viewObj = OnBoardStepTwoVM()
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewObj.getGoals {
            DispatchQueue.main.async {
                self.goalsCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if viewObj.isFromSettings{
            self.titleLbl.text = "Change your Goal"
        }
    }
    
    
    //MARK:- IBActions
    @IBAction func beginnerBtnClicked(_ sender: UIButton) {
        self.setCurrentFitness(sender: sender.tag)
    }
    
    @IBAction func intermediateBtnClicked(_ sender: UIButton) {
        self.setCurrentFitness(sender: sender.tag)
    }
    
    @IBAction func expertBtnClicked(_ sender: UIButton) {
        self.setCurrentFitness(sender: sender.tag)
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        self.checkValidations()
        
    }   
    
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
}
