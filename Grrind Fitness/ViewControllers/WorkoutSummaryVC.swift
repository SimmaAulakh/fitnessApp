//
//  WorkoutSummaryVC.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 02/08/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit
import Charts

class WorkoutSummaryVC: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var todayWorkoutChartView: PieChartView!
    @IBOutlet weak var mondayLogo: UIImageView!
    @IBOutlet weak var tuesdayLogo: UIImageView!
    @IBOutlet weak var thursdayLogo: UIImageView!
    @IBOutlet weak var wednesdayLogo: UIImageView!
    @IBOutlet weak var fridayLogo: UIImageView!
    @IBOutlet weak var saturdayLogo: UIImageView!
    @IBOutlet weak var sundayLogo: UIImageView!
    @IBOutlet weak var workoutMessageLbl: UILabel!
    
    @IBOutlet weak var cardioLbl: UILabel!
    @IBOutlet weak var strengthLbl: UILabel!
    @IBOutlet weak var stretchLbl: UILabel!
    
    //MARK:- Variables
    let viewObj = WorkoutSummaryVM()
    var cardioDataEntry = PieChartDataEntry(value: 0)
    var stretchDataEntry = PieChartDataEntry(value: 0)
    var strengthDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfWorkoutDataEntries = [PieChartDataEntry]()
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let req = GetSummary.request(user_id: DataManager.shared.UserID, date: Date().toString(dateFormat: "yyyy-MM-dd"), type: "get")
        let dataDic = HelpingVC.shared.setBodyParams(request: req)
        viewObj.saveSummary(request: dataDic) {
            DispatchQueue.main.async {
                self.todayWorkoutChartView.chartDescription?.text = ""
                self.cardioDataEntry.value = Double(self.viewObj.summryData?.category?.cardio ?? 0)
                self.stretchDataEntry.value = Double(self.viewObj.summryData?.category?.stretch ?? 0)
                self.strengthDataEntry.value = Double(self.viewObj.summryData?.category?.strength ?? 0)
                self.numberOfWorkoutDataEntries = [self.cardioDataEntry,self.stretchDataEntry,self.strengthDataEntry]
                self.updateChartData()
                self.setWeeklyGoal()
            }
        }
        
        
    }
    
   
    
    //MARK:- IBActions
    
    @IBAction func shareBtnClicked(_ sender: Any) {
        let items = ["Checkout my workout summary on 'Eccentric'!"]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        let vcs = self.navigationController?.viewControllers
        for vc in vcs ?? [] {
            if vc is HomeViewController{
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        let vcs = self.navigationController?.viewControllers
        for vc in vcs ?? [] {
            if vc is HomeViewController{
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
}
