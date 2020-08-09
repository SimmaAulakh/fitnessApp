//
//  WorkoutDataManager.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 05/08/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation

class WorkoutDataManager {
    
   static let shared = WorkoutDataManager()
    
    var totalWorkoutLenght = 0
    var myWorkoutData = WorkoutData()
    
}

struct WorkoutData {
    var cardioTime:Int = 0
    var strengthTime:Int = 0
    var streatchTime:Int = 0
    var totalTime:Int = 0
    var totalPerformedTime:Int = 0
}
