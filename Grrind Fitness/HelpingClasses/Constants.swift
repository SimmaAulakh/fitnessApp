//
//  Constants.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 10/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

struct BaseURL {
    static let base_url_dev = "http://ec2-18-222-227-245.us-east-2.compute.amazonaws.com/ecentric/api/"
}

struct WebServicesApi {
    static let login = "login"
    static let register = "register"
    static let getQuestions = "get-questions?id="
    static let forgotPassword = "forgot-password"
    static let saveQuestions = "save-questions"
    static let userQuestions = "user-questions"
    static let getGoals = "goals"
    static let saveUserGoal = "save-user-goals"
    static let exercices = "user-goals"
    static let userSelectedGoals = "user-selected-goals"
    static let workoutSummary = "workout-type"
}

struct Constants {
    struct AppInfo {
        static let APP_NAME = "Eccentric"
    }
    
    struct AppColors {
        static let APP_ORANGE_COLOR : UIColor = UIColor(red:255/255, green:109/255, blue:98/255, alpha:1)
        static let APP_GREY_COLOR : UIColor = UIColor(red: 120, green: 120, blue: 120, alpha: 1.0)
    }
    
    struct Alert_Messages {
        static let noInternetConnection: String = "Internet not available, Cross check your internet connectivity and try again"
        static let emptyEmail: String = "Email field can't be empty"
        static let invalidEmail: String = "Entered email is not valid"
        static let emptySubject: String = "Subject field can't be empty"
        static let emptyMessage: String = "Message field can't be empty"
        static let requestSuccess:String = "Request submitted successfully"
        static let passwordUnMatched:String = "Password and confirm password did not matched."
        static let emptyField:String = "Please fill all required fields first."
        static let somethingWentWrong:String = "Something went wrong."
        static let limitFourOptions:String = "You can only choose 4 options."
        static let logoutUser:String = "Are you sure you want to log out of \(Constants.AppInfo.APP_NAME)?"
        static let selectGoal = "Please select goals first."
    }
}
