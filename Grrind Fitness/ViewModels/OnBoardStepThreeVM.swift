//
//  OnBoardStepThreeVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 13/05/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class OnBoardStepThreeVM {
    
}

extension OnBoardStepThreeVC{
    func setIdealBody(sender:Int){
    
            toneLeanBtn.backgroundColor = toneLeanBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            toneLeanBtn.setTitleColor(toneLeanBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
            
            slimBtn.backgroundColor = slimBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            slimBtn.setTitleColor(slimBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
            
            fitMuscularBtn.backgroundColor = fitMuscularBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            fitMuscularBtn.setTitleColor(fitMuscularBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
            
            hourglassBtn.backgroundColor = hourglassBtn.tag == sender ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            hourglassBtn.setTitleColor(hourglassBtn.tag == sender ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
      
    }
    
    func setWhyDecidedForWorkout(sender:UIButton){
        
        sender.backgroundColor = sender.isSelected ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        sender.setTitleColor( sender.isSelected ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        
       
    }
    
}
extension OnBoardStepThreeVC : UITextFieldDelegate {
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
