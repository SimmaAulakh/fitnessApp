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
    
    //MARK:- Variables
    let viewObj = WorkoutSummaryVM()
    var cardioDataEntry = PieChartDataEntry(value: 0)
    var stretchDataEntry = PieChartDataEntry(value: 0)
    var strengthDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfWorkoutDataEntries = [PieChartDataEntry]()
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

      todayWorkoutChartView.chartDescription?.text = ""
        cardioDataEntry.value = Double((WorkoutDataManager.shared.myWorkoutData.cardioTime )/60)
        stretchDataEntry.value = Double((WorkoutDataManager.shared.myWorkoutData.streatchTime )/60)
        strengthDataEntry.value = Double((WorkoutDataManager.shared.myWorkoutData.strengthTime )/60)
        
        numberOfWorkoutDataEntries = [cardioDataEntry,stretchDataEntry,strengthDataEntry]
        updateChartData()
    }
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(entries:numberOfWorkoutDataEntries,label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(red: 233/255, green: 80/255, blue: 49/255, alpha: 1.0),UIColor.green,UIColor.black]
        chartDataSet.colors = colors
        
        todayWorkoutChartView.data = chartData
    }
    
    //MARK:- IBActions
  

}
