//
//  WorkoutSummaryVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 02/08/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import Charts
import UIKit

class WorkoutSummaryVM {
    
    //MARK:- Variables
    var summryData:SummaryData?
    
    //MARK:- WebServices
    func saveSummary(request:NSMutableDictionary,completionHandler:@escaping()->()){
        APIManager.shared.saveGetSummary(request: request, requestType: HttpMethod.post) { (responseData,message) in
            self.summryData = responseData
            completionHandler()
        }
    }
}

extension WorkoutSummaryVC{
    
    func setWeeklyGoal(){
        cardioLbl.text = String(self.viewObj.summryData?.category?.cardio ?? 0) + " min"
        strengthLbl.text = String(self.viewObj.summryData?.category?.strength ?? 0) + " min"
        stretchLbl.text = String(self.viewObj.summryData?.category?.stretch ?? 0) + " min"
        
        mondayLogo.image = viewObj.summryData?.weekdays?.monday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        tuesdayLogo.image = viewObj.summryData?.weekdays?.tuesday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        wednesdayLogo.image = viewObj.summryData?.weekdays?.wednesday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        thursdayLogo.image = viewObj.summryData?.weekdays?.thursday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        fridayLogo.image = viewObj.summryData?.weekdays?.friday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        saturdayLogo.image = viewObj.summryData?.weekdays?.saturday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        sundayLogo.image = viewObj.summryData?.weekdays?.sunday == 1 ? #imageLiteral(resourceName: "logo") : #imageLiteral(resourceName: "circle")
        
        var daysWorkedOut = 0
        daysWorkedOut += viewObj.summryData?.weekdays?.monday == 1 ? 1 : 0
        daysWorkedOut += viewObj.summryData?.weekdays?.tuesday == 1 ? 1 : 0
        daysWorkedOut += viewObj.summryData?.weekdays?.wednesday == 1 ? 1 : 0
        daysWorkedOut += viewObj.summryData?.weekdays?.thursday == 1 ? 1 : 0
        daysWorkedOut += viewObj.summryData?.weekdays?.friday == 1 ? 1 : 0
        daysWorkedOut += viewObj.summryData?.weekdays?.saturday == 1 ? 1 : 0
        daysWorkedOut += viewObj.summryData?.weekdays?.sunday == 1 ? 1 : 0
        
        workoutMessageLbl.text = "Workout \(7-daysWorkedOut) more days to complete this week's goal."
        
    }
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(entries:numberOfWorkoutDataEntries,label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(red: 233/255, green: 80/255, blue: 49/255, alpha: 1.0),UIColor.green,UIColor.black]
        chartDataSet.colors = colors
        
        todayWorkoutChartView.data = chartData
    }
}
