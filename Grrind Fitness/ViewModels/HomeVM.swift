//
//  HomeVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 20/07/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class HomeVM {
    //MARK:- Variables
    var exercises :[ExerciseData] = []
    var selectedGoals:[UserGoalsData] = []
    var intensitySelected:String?
    
    
    //MARK:- API Functions
    ///API to fetch all exercises depending on goals selected by user.
      func getExercises(dataDic:NSMutableDictionary,completionHandler:@escaping()->()) {
        APIManager.shared.getExercises(request: dataDic) { (responseArr) in
            self.exercises = responseArr
            completionHandler()
        }
    }
    
    func getUsersGoals(dataDic:NSMutableDictionary,completionHandler:@escaping()->()) {
        APIManager.shared.getUserSelectedGoals(request: dataDic) { (userGoals) in
            self.selectedGoals = userGoals
            completionHandler()
        }
    }
    
}

extension HomeViewController{
    
    func checkValidations(){
        if minuteTF[0].text == "" || minuteTF[1].text == ""{
             self.showAlert(message:Constants.Alert_Messages.exerciseTime)
        }else if !standrdBtn.isSelected && !easyBtn.isSelected && !advancedBtn.isSelected{
            self.showAlert(message:Constants.Alert_Messages.selectIntensity)
        }else{
            var minutes = ""
                   for tf in minuteTF{
                       minutes.append(tf.text ?? "")
                   }
                   
                   if minutes != ""{
                       WorkoutDataManager.shared.totalWorkoutLenght = (Int(minutes) ?? 0) * 60
                       // self.pushToVC(vcID: "WorkoutVideoVC")
                       var wType = ""
                       if increaseMobilitySwitch.isOn{
                           wType = "pre"
                           
                       }
                       if reduceFatigueSwitch.isOn{
                           wType = "post"
                       }
                       if increaseMobilitySwitch.isOn && reduceFatigueSwitch.isOn{
                           wType = "both"
                       }
                       let req = Exercises.request(type: viewObj.intensitySelected,id: DataManager.shared.UserID,workout_type:wType)
                       let dataDic = HelpingVC.shared.setBodyParams(request: req)
                       viewObj.getExercises(dataDic: dataDic) {
                           DispatchQueue.main.async {
                               let vc = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutVideoVC") as? WorkoutVideoVC
                               vc?.viewObj.exercises = self.viewObj.exercises
                               self.navigationController?.pushViewController(vc!, animated: true)
                           }
                       }
                       
                       
                   }
        }
    }
    
    func selectIntensity(intensity:String){
        easyBtn.isSelected = false
        standrdBtn.isSelected = false
        advancedBtn.isSelected = false
        switch intensity {
        case "easy":
            easyBtn.isSelected = true
        case "standard":
            standrdBtn.isSelected = true
        case "advanced":
            advancedBtn.isSelected = true
        default:
            break
        }
    }
}

extension HomeViewController:UITextFieldDelegate{
    
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let newString = ((textField.text)! as NSString).replacingCharacters(in: range, with: string)
    if newString.count == 1 {
        textFieldShouldReturnSingle(textField, newString : newString)
        return false
    }
    return true
}
    
func textFieldShouldReturnSingle(_ textField: UITextField, newString : String)
{


    let nextTag: Int = textField.tag + 1
    textField.text = newString
    let nextResponder = self.view.viewWithTag(nextTag) as? UITextField
    if let nextR = nextResponder
    {
        // Found next responder, so set it.
        nextR.becomeFirstResponder()
    }
    else
    {
        // Not found, so remove keyboard.
        textField.resignFirstResponder()
        // call your method
    }
   }

}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewObj.selectedGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyGoalsCell", for: indexPath) as? MyGoalsCell
        cell?.goalNameLbl.text = viewObj.selectedGoals[indexPath.row].nickname
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 20
        let height = collectionView.frame.height / 2 - 10
        return CGSize(width: width, height: height)
    }
}
