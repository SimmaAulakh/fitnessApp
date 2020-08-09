//
//  WorkoutLengthPopUpVM.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 13/06/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import Foundation
import UIKit

class WorkoutLengthPopUpVM {
    
}
extension WorkoutLengthPopupVC : UITextFieldDelegate {
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
