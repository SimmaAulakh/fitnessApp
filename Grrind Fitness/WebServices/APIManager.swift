//
//  APIManager.swift
//  Sorsr
//
//  Created by user on 31/03/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    let jsonDecoder = JSONDecoder()
    
    ///API to register a new user
    func registerUser(request:NSMutableDictionary,completionHandler:@escaping(_ responseData:Data)->()){
        
        WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.register, httpMethod: HttpMethod.post, parameters: request, authorizationRequired: false) { (responseData, responseError) in
            
            
            do {
                let responseModel = try self.jsonDecoder.decode(Register_Base.self, from: responseData!)
                
                if responseModel.code == 200{
                    DataManager.shared.UserName = responseModel.data?.name ?? ""
                    DataManager.shared.UserID = responseModel.data?.id?.toString() ?? "0"
                    DataManager.shared.AuthToken = responseModel.data?.token ?? ""
                    completionHandler(responseData!)
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                let responseModel = try? self.jsonDecoder.decode(MessageBase.self, from: responseData!)
                if responseModel != nil{
                    HelpingVC.shared.showAlert(message: responseModel?.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
                print(error.localizedDescription)
            }
        }
    }
    
    ///Login User
    func loginUser(request:NSMutableDictionary,completionHandler:@escaping(_ responseData:Data)->()){
        
        WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.login, httpMethod: HttpMethod.post, parameters: request, authorizationRequired: false) { (responseData, responseError) in
            completionHandler(responseData!)
        }
    }
    
    ///API for getting all questions and options
    func getQuestions(id:String,completionHandler:@escaping(_ responseData:[QuestionData])->()){
        
        WebServices.shared.apiMethodWithoutParam(urlComponent: WebServicesApi.getQuestions + id, httpMethod: HttpMethod.get, authorizationRequired: false) { (responseData, responseError) in
            
            
            do {
                let responseModel = try self.jsonDecoder.decode(Questions_Base.self, from: responseData!)
                if responseModel.code == 200{
                    completionHandler(responseModel.data ?? [])
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    ///API for getting all live goals
    func getGoals(completionHandler:@escaping(_ responseData:[GoalData])->()){
        
        WebServices.shared.apiMethodWithoutParam(urlComponent: WebServicesApi.getGoals, httpMethod: HttpMethod.get, authorizationRequired: false) { (responseData, responseError) in
            do {
                let responseModel = try self.jsonDecoder.decode(GoalsBase.self, from: responseData!)
                if responseModel.code == 200{
                    completionHandler(responseModel.data ?? [])
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    ///API for saving all selected goals
    func submitSelectedGoals(request:NSMutableDictionary,completionHandler:@escaping(_ responseData:String)->()){
        
        WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.saveUserGoal, httpMethod: HttpMethod.post, parameters: request, authorizationRequired: false) { (responseData, responseError) in
            do {
                let responseModel = try self.jsonDecoder.decode(MessageBase.self, from: responseData!)
                if responseModel.code == 200{
                    completionHandler(responseModel.message ?? "")
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    //    ///API for getting all live goals
    //       func getExercises(completionHandler:@escaping(_ responseData:[GoalData])->()){
    //
    //        WebServices.shared.apiMethodWithoutParam(urlComponent: WebServicesApi.exercices + DataManager.shared.UserID, httpMethod: HttpMethod.get, authorizationRequired: false) { (responseData, responseError) in
    //               do {
    //                   let responseModel = try self.jsonDecoder.decode(GoalsBase.self, from: responseData!)
    //                   if responseModel.code == 200{
    //                       completionHandler(responseModel.data ?? [])
    //                   }else{
    //                       HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
    //                   }
    //               } catch {
    //                   print(error.localizedDescription)
    //               }
    //           }
    //       }
    
    func forgotPassword(request:NSMutableDictionary,completionHandler:@escaping(_ responseData:String)->()){
        
        WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.forgotPassword, httpMethod: HttpMethod.post, parameters: request, authorizationRequired: false) { (responseData, responseError) in
            do {
                let responseModel = try self.jsonDecoder.decode(MessageBase.self, from: responseData!)
                if responseModel.code == 200{
                    completionHandler(responseModel.message ?? "")
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getExercises(request:NSMutableDictionary,completionHandler:@escaping(_ responseData:[ExerciseData])->()){
        
        WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.exercices, httpMethod: HttpMethod.post, parameters: request, authorizationRequired: true) { (responseData, responseError) in
            do {
                let responseModel = try self.jsonDecoder.decode(Exercises_Base.self, from: responseData!)
                if responseModel.code == 200{
                    completionHandler(responseModel.data ?? [])
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserSelectedGoals(request:NSMutableDictionary,completionHandler:@escaping(_ responseData:[UserGoalsData])->()){
        
        WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.userSelectedGoals, httpMethod: HttpMethod.post, parameters: request, authorizationRequired: true) { (responseData, responseError) in
            do {
                let responseModel = try self.jsonDecoder.decode(UserGoals_Base.self, from: responseData!)
                if responseModel.code == 200{
                    completionHandler(responseModel.data ?? [])
                }else{
                    HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func saveGetSummary(request:NSMutableDictionary,requestType:String,completionHandler:@escaping(_ responseData:SummaryData)->()){
           
           WebServices.shared.apiMethodWithParameters(urlComponent: WebServicesApi.workoutSummary, httpMethod:requestType, parameters: request, authorizationRequired: true) { (responseData, responseError) in
               do {
                   let responseModel = try self.jsonDecoder.decode(Summary_Base.self, from: responseData!)
                   if responseModel.code == 200{
                    completionHandler(responseModel.data! )
                   }else{
                       HelpingVC.shared.showAlert(message: responseModel.message ?? Constants.Alert_Messages.somethingWentWrong)
                   }
               } catch {
                   print(error.localizedDescription)
               }
           }
       }
}
