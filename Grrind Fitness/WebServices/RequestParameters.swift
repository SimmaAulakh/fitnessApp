//
//  RequestParameters.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 09/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation


struct HttpMethod {
    static let post = "POST"
    static let get = "GET"
}

enum Login {
    struct request {
        var email:String?
        var password:String?
    }
}

enum Register {
    struct request {
        var firstname:String?
        var lastname:String?
        var email:String?
        var password:String?
        var country:String?
        var city:String?
        var dob:String?
        var gender:String?
        var weight:String?
        var height:String?
    }
}

enum FrogotPassword {
    struct request {
        var email:String?
    }
}

enum SaveQuestions {
    struct request {
        var question:NSMutableDictionary?
        var user_id: String?
    }
}

enum SaveUserGoals{
    struct request {
        var user_id:String?
        var goals:[Int]?
    }
}

enum Exercises {
    struct request {
        var type:String?
        var id:String?
        var workout_type:String?
    }
}

enum UserGoalsSelected {
    struct request {
        var user_id:String?
    }
}

enum SaveSummary{
    struct request {
        var user_id:String?
        var date:String?
        var type:String?
        var category:String?
    }
}

enum GetSummary{
    struct request {
        var user_id:String?
        var date:String?
        var type:String?
    }
}

struct Categorys {
    var stretch:String?
    var cardio:String?
    var strength:String?
}
