//
//  OnBoardStepTwoVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 13/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class OnBoardStepTwoVM {
    //MARK:- Variables
    var longTermGoals:[Answers] = []
    var selectedIndexPath:[IndexPath] = []
    var goalsArr:[GoalData] = []
    var selectedGoals:[Int] = []
    var isFromSettings = false
    
    //MARK:- API Requests
        func getQuestionsData(completionHandler:@escaping()->()) {
            APIManager.shared.getQuestions(id: DataManager.shared.UserID) { (questions) in
                //Long term goals options will always come at first index of the Array
                self.longTermGoals = questions[1].answers ?? []
                completionHandler()
            }
       }
    
    func getGoals(completionHandler:@escaping()->()) {
           APIManager.shared.getGoals() { (goals) in
               //Long term goals options will always come at first index of the Array
            self.goalsArr = goals
               completionHandler()
           }
      }
    
    func submitGoalsApi(body:NSMutableDictionary,completionHandler:@escaping(_ responseMessage:String)->()) {
        APIManager.shared.submitSelectedGoals(request: body) { (message) in
            completionHandler(message)
        }
    }
}

extension OnBoardStepTwoVC{
    //MARK:- User Defined Functions
    func checkValidations(){
        if viewObj.selectedGoals.count == 0{
            self.showAlert(message: Constants.Alert_Messages.selectGoal)
        }else{
            let req = SaveUserGoals.request(user_id: DataManager.shared.UserID, goals: viewObj.selectedGoals)
            let dataDic = HelpingVC.shared.setBodyParams(request: req)
            viewObj.submitGoalsApi(body: dataDic) {resMessage in
                
                DispatchQueue.main.async {
                    if !self.viewObj.isFromSettings{
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardStepThreeVC") as? OnBoardStepThreeVC
                        
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }else{
                        HelpingVC.shared.showAlertWithCompletion(title: Constants.AppInfo.APP_NAME, message: resMessage) { (status) in
                            self.popVC()
                        }
                    }
                }
            }
        }
    }
    
    
    func setCurrentFitness(sender:Int){
        begnnerBtn.backgroundColor = begnnerBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        begnnerBtn.setTitleColor(begnnerBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        
        intermediateBtn.backgroundColor = intermediateBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        intermediateBtn.setTitleColor(intermediateBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        
        expertBtn.backgroundColor = expertBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        expertBtn.setTitleColor(expertBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
    }
}

extension OnBoardStepTwoVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewObj.goalsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as? ButtonCell
        cell?.titleLbl.text = viewObj.goalsArr[indexPath.row].nickname
        self.goalsCollectionViewHeight.constant = collectionView.contentSize.height
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ButtonCell
        
        if viewObj.selectedIndexPath.contains(indexPath){
            let index = viewObj.selectedIndexPath.firstIndex(of: indexPath)!
            viewObj.selectedIndexPath.remove(at: index)
            viewObj.selectedGoals.remove(at: index)
            cell?.contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell?.titleLbl.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }else{
            if viewObj.selectedIndexPath.count < 4{
                viewObj.selectedIndexPath.append(indexPath)
                viewObj.selectedGoals.append(viewObj.goalsArr[indexPath.row].id ?? 0)
                cell?.contentView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
                cell?.titleLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }else{
                self.showAlert(message: Constants.Alert_Messages.limitFourOptions)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 5
        let height = 0.056338 * self.view.frame.height
        return CGSize(width: width, height: height)
    }
    
    
}
