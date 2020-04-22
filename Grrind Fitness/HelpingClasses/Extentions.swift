//
//  Extentions.swift
//  Grrind Fitness
//
//  Created by user on 09/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit
import AVFoundation


class ViewWithShadow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.cornerRadius = 20
            self.layer.masksToBounds = true
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: -1, height: -1)
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
    }
    
}
class TextFieldWithShadow: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.borderWidth = 1
              self.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.6156862745, blue: 0.2392156863, alpha: 1).cgColor
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            self.layer.shadowColor = #colorLiteral(red: 1, green: 0.7019607843, blue: 0.4862745098, alpha: 1)
            self.layer.shadowOffset = CGSize(width: -1, height: -1)
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 5
            self.layer.masksToBounds = false
        }
    }
    
}
class TextFieldWithShadow1: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.borderWidth = 1
            self.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.6156862745, blue: 0.2392156863, alpha: 1).cgColor
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            self.layer.shadowColor = #colorLiteral(red: 1, green: 0.7019607843, blue: 0.4862745098, alpha: 1)
            self.layer.shadowOffset = CGSize(width: -1, height: -1)
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
    }
    
}

class TextFieldWithShadow2: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.borderWidth = 1
              self.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.6156862745, blue: 0.2392156863, alpha: 1).cgColor
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            //self.layer.shadowColor = #colorLiteral(red: 1, green: 0.7019607843, blue: 0.4862745098, alpha: 1)
            //self.layer.shadowOffset = CGSize(width: -1, height: -1)
           // self.layer.shadowOpacity = 1
           // self.layer.shadowRadius = 5
           // self.layer.masksToBounds = false
        }
    }
    
}


//MARK:- UIButton Extension
extension UIButton{
    func buttonWithBorder(color:UIColor,cornerRadius:Float) {
        DispatchQueue.main.async{
            
            self.layer.cornerRadius = CGFloat(cornerRadius)
            self.layer.masksToBounds = true
            self.layer.borderWidth = 1.0
            self.layer.borderColor = color.cgColor
        }
    }
}

//MARK:- UIView Extension
extension UIView{
    func addDottedBorderToView(strokeColor:UIColor){
        DispatchQueue.main.async{
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = strokeColor.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.cornerRadius = self.bounds.height/2
            yourViewBorder.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.height/2).cgPath
            self.layer.addSublayer(yourViewBorder)
        }
    }
    
    func addBorderAndCornerRadiusToView(borderColor:UIColor,cornerRadius:CGFloat,borderWidth:CGFloat){
        DispatchQueue.main.async{
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0) {
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.black.cgColor
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
    
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

//MARK:- UIViewController Extension
extension UIViewController{
    
  
    
    func showAlertWithCompletion(title:String,message:String, completionHandler: @escaping (_ status: Bool?) -> ()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            completionHandler(true)
        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        //            completionHandler(false)
        //        }
        alert.addAction(okAction)
        // alert.addAction(cancelAction)
        alert.show()
        //  self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: Constants.AppInfo.APP_NAME, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        //
        //        }
        alert.addAction(okAction)
        // alert.addAction(cancelAction)
        alert.show()
        //self.present(alert, animated: true, completion: nil)
    }
}

extension UITextField{
    
    // MARK: - Validate Email
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailPredicate.evaluate(with: self.text) {
            return true
        }
        return false
    }
    
    func isEmpty() -> Bool{
        if self.text == ""{
            return true
        }
        return false
    }
    
    func phoneNumberValidation() -> Bool {
        let phone_regex = "(\\+?)(\\d{10,13})"
        //        let phone_regex = "^\\d{3}-\\d{3}-\\d{4}$"
        //        let phone_regex = "[789][0-9]{9}"
        
        //        let phone_regex = "((\\+)|(00))[0-9]{6,14}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@",phone_regex)
        return phoneTest.evaluate(with: self.text)
        
    }
}



extension UITextView{
    
    func isEmpty() -> Bool{
        if self.text == ""{
            return true
        }
        return false
    }
}

public extension UIAlertController {
    func show() {
        if #available(iOS 13.0, *) {
            if var topController = UIApplication.shared.keyWindow?.rootViewController  {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(self, animated: true, completion: nil)
            }
        }else{
            let win = UIWindow(frame: UIScreen.main.bounds)
            let vc = UIViewController()
            vc.view.backgroundColor = .clear
            win.rootViewController = vc
            win.windowLevel = UIWindow.Level.alert + 1  // Swift 3-4: UIWindowLevelAlert + 1
            win.makeKeyAndVisible()
            vc.present(self, animated: true, completion: nil)
        }
    }
}

class AppRoundCornerRedButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.cornerRadius = self.frame.height/2
            self.layer.masksToBounds = true
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
    }
    
}

class RoundButtonWithBorder: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.cornerRadius = self.bounds.height/2
            self.layer.masksToBounds = true
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.red.cgColor//Constants.AppColor.APP_RED_COLOR.cgColor
        }
    }
}



class ViewWithGradient: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
         let gradient: CAGradientLayer = CAGradientLayer()

            gradient.colors = [#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1).cgColor, #colorLiteral(red: 0.1921568627, green: 0.3529411765, blue: 0.7450980392, alpha: 1).cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)

            self.layer.insertSublayer(gradient, at: 0)
        }
    }
    
}

class ViewWithGradient1: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
         let gradient: CAGradientLayer = CAGradientLayer()

            gradient.colors = [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1).cgColor, #colorLiteral(red: 0.7764705882, green: 0.4235294118, blue: 0.8117647059, alpha: 1).cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)

            self.layer.insertSublayer(gradient, at: 0)
        }
    }
    
}

class ViewWithGradient2: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
         let gradient: CAGradientLayer = CAGradientLayer()

            gradient.colors = [#colorLiteral(red: 0, green: 0.7529411765, blue: 0.2901960784, alpha: 1).cgColor, #colorLiteral(red: 0.2274509804, green: 0.9725490196, blue: 0.8705882353, alpha: 1).cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)

            self.layer.insertSublayer(gradient, at: 0)
        }
    }
    
}

class ButtonwithGradient: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
         let gradient: CAGradientLayer = CAGradientLayer()

            gradient.colors = [#colorLiteral(red: 0.06666666667, green: 0.2941176471, blue: 0.8745098039, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0.9019607843, blue: 0.8039215686, alpha: 1).cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
            gradient.cornerRadius = 10
            
            

            self.layer.insertSublayer(gradient, at: 0)
            
            self.layer.cornerRadius = 10//self.frame.height/2
                 self.layer.masksToBounds = true
                 self.layer.shadowColor = #colorLiteral(red: 0.4156862745, green: 0.9607843137, blue: 0.9921568627, alpha: 1)
                 self.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layer.shadowOpacity = 1.0
                 self.layer.shadowRadius = 5.0
                 self.layer.masksToBounds = false
                 self.layer.borderWidth = 2.0
                 self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)//UIColor.lightGray.cgColor
        }
    }
    
}

class ButtonwithGradient1: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
         let gradient: CAGradientLayer = CAGradientLayer()

            gradient.colors = [#colorLiteral(red: 0.9882352941, green: 0.2862745098, blue: 0.6862745098, alpha: 1).cgColor, #colorLiteral(red: 0.9882352941, green: 0.6196078431, blue: 0.2588235294, alpha: 1).cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
            gradient.cornerRadius = 10
            
            

            self.layer.insertSublayer(gradient, at: 0)
            
            self.layer.cornerRadius = 10//self.frame.height/2
                 self.layer.masksToBounds = true
                 self.layer.shadowColor = #colorLiteral(red: 0.9960784314, green: 0.6666666667, blue: 0.8352941176, alpha: 1)
                 self.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layer.shadowOpacity = 1.0
                 self.layer.shadowRadius = 5.0
                 self.layer.masksToBounds = false
                 self.layer.borderWidth = 2.0
                 self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)//UIColor.lightGray.cgColor
        }
    }
    
}



class ViewWithBorder: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.cornerRadius = 10//self.frame.height/2
            self.layer.masksToBounds = true
            self.layer.shadowColor = #colorLiteral(red: 0.568627451, green: 0.9215686275, blue: 0.8392156863, alpha: 1)
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 5.0
            self.layer.masksToBounds = false
            self.layer.borderWidth = 1.0
            self.layer.borderColor = #colorLiteral(red: 0.568627451, green: 0.9215686275, blue: 0.8392156863, alpha: 1)//UIColor.lightGray.cgColor
        }
    }
    
}

class CustomViewForProfilePic: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.cornerRadius = self.frame.height/4
            self.layer.masksToBounds = true
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 5.0
            self.layer.masksToBounds = false
            self.clipsToBounds = true
            self.layer.borderWidth = 2.0
            self.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        }
    }
    
}


class ViewWithGrayBorder: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        DispatchQueue.main.async{
            self.layer.cornerRadius = self.frame.height/2
            self.layer.masksToBounds = true
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
}

class TwoSidesCornerRadius:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 40)
    }
}

class TwoSidesCornerRadiusBottom:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.bottomLeft, .bottomRight], radius: 40)
        
    }
}

class TwoSidesCornerRadiusBottomWithShadow:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.bottomLeft, .bottomRight], radius: 40)
        
    }
}

extension UIViewController
{
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 2) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    func hideNavigationBar()
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func convertToLocalDateFormat(utcDate:String) -> String
    {
        if utcDate.count == 0
        {
            return ""
        }
        else
        {
            // create dateFormatter with UTC time format
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let dt = dateFormatter.date(from: utcDate)
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "dd/MM/yyyy  hh:mm a"
            
            return dateFormatter.string(from: dt!)
            
        }
        
    }
    
    func convertToLocalOnlyDate(utcDate:String) -> String
    {
        if utcDate.count == 0
        {
            return ""
        }
        else
        {
            // create dateFormatter with UTC time format
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            let dt = dateFormatter.date(from: utcDate)
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            return dateFormatter.string(from: dt!)
        }
        
    }
    func convertDateFormater(_ date: String) -> String
    {
        if date.count == 0
        {
            return ""
        }
        else
        {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return  dateFormatter.string(from: date!)
        }
    }
    
    
    func convertToLocalOnlyTime(utcDate:String) -> String
    {
        if utcDate.count == 0
        {
            return ""
        }
        else
        {
            // create dateFormatter with UTC time format
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            let dt = dateFormatter.date(from: utcDate)
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "hh:mm a"
            
            return dateFormatter.string(from: dt!)
        }
    }
    
    func convertToLocalDateFormatOnlyDate(utcDate:String) -> String
    {
        if utcDate.count == 0
        {
            return ""
        }
        else
        {
            // create dateFormatter with UTC time format
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            let dt = dateFormatter.date(from: utcDate)
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            return dateFormatter.string(from: dt!)
        }
    }
    
    func convertToLocalDateFormatOnlyTime(utcDate:String) -> String
    {
        if utcDate.count == 0
        {
            return ""
        }
        else
        {
            // create dateFormatter with UTC time format
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            let dt = dateFormatter.date(from: utcDate)
            dateFormatter.timeZone = TimeZone.current
            
            let finalDateStr = dateFormatter.string(from: dt!)
            dateFormatter.dateFormat = "yyyy/MM/dd'T'HH:mm:ss.SSS'Z'"
            
            //  return dateFormatter.date(from: differenceDate!)
            return Date().offsetLong(date: dateFormatter.date(from: finalDateStr)!)
        }
    }
    
    func convertToLocalDateFormatOnlyTimeToDate(utcDate:String) -> Date
    {
        
        // create dateFormatter with UTC time format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let dt = dateFormatter.date(from: utcDate)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy/MM/dd'T'HH:mm:ss.SSS'Z'"
        
        
        return dt!
        
    }
    
    func convertTimestampToDateTime(value:Double) -> Int{
        let date = Date(timeIntervalSince1970: value/1000.0)
        //  let dateStr = value.getDateStringFromUTC()
        let secondsDiff = getDateDiff(start: Date(), end:date)
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        //        dateFormatter.dateStyle = DateFormatter.Style.medium
        //        dateFormatter.timeZone = .current
        //        let localDate = dateFormatter.string(from: date)
        return secondsDiff
    }
    
    func getDateDiff(start: Date, end: Date) -> Int  {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([Calendar.Component.second], from: start, to: end)
        
        let seconds = dateComponents.second!
        return seconds
    }
    
}

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

//MARK:- extension to set label on collectionview background

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}

extension UISearchBar {
    
    // Due to searchTextField property who available iOS 13 only, extend this property for iOS 13 previous version compatibility
    var compatibleSearchTextField: UITextField {
        guard #available(iOS 13.0, *) else { return legacySearchField }
        return self.searchTextField
    }
    
    private var legacySearchField: UITextField {
        if let textField = self.subviews.first?.subviews.last as? UITextField {
            // Xcode 11 previous environment
            return textField
        } else if let textField = self.value(forKey: "searchField") as? UITextField {
            // Xcode 11 run in iOS 13 previous devices
            return textField
        } else {
            // exception condition or error handler in here
            return UITextField()
        }
    }
}
extension Double {
    func getDateStringFromTimeStamp(dateformat:String) -> String {
        let date = Date(timeIntervalSince1970: (self/1000))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  dateformat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: date)
    }
    
    func getDateFromTimeStamp() -> Date {
        let date = Date(timeIntervalSince1970: (self/1000))
        return date
    }
    
}
extension UIView {
    
    func roundCorners(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    func addViewShadow() {
        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.2)) {
            let shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.6, height: 2.6)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 8.0
            self.layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    func addDashedBorderForCollectionView(frame:CGRect) {
        let color = UIColor.darkGray.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        
        let frameSize = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width/2 - 10, height: frame.size.width/2 - 25)// self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 10).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    func addDashedBorder() {
        let color = UIColor.darkGray.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 10).cgPath
        
        self.layer.addSublayer(shapeLayer)
        
    }
    func addDashedLine(color: UIColor = .lightGray) {
        layer.sublayers?.filter({ $0.name == "DashedTopLine" }).map({ $0.removeFromSuperlayer() })
        backgroundColor = .clear
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "DashedTopLine"
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6, 3]
        shapeLayer.path = UIBezierPath(roundedRect: self.frame, cornerRadius: 10).cgPath
        
        let path = CGMutablePath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        
        layer.addSublayer(shapeLayer)
    }
    
    func addNoDataViewOnTable(tableView:UITableView) -> UIView{
        let noDataLbl = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        noDataLbl.textAlignment = .center
        noDataLbl.numberOfLines = 1
        noDataLbl.text = "No Data Found"
        return noDataLbl
    }
}

class CustomSlider: UISlider {
    @IBInspectable var trackHeight: CGFloat = 2
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }
}

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    func offsetLong(date: Date) -> String {
        if years(from: date)   > 0
        {
            if months(from: date)  < 12
            {
                return months(from: date) > 1 ? "\(months(from: date)) months ago" : "\(months(from: date)) month ago"
            }
            else
            {
                return years(from: date) > 1 ? "\(years(from: date)) years ago" : "\(years(from: date)) year ago"
            }
        }
        if months(from: date)  > 0
        {
            if weeks(from: date)   < 4
            {
                return weeks(from: date) > 1 ? "\(weeks(from: date)) weeks ago" : "\(weeks(from: date)) week ago"
            }
            else
            {
                return months(from: date) > 1 ? "\(months(from: date)) months ago" : "\(months(from: date)) month ago"
            }
        }
        if weeks(from: date)   > 0
        {
            if days(from: date)    < 7
            {
                return days(from: date) > 1 ? "\(days(from: date)) days ago" : "\(days(from: date)) day ago"
            }
            else
            {
                return weeks(from: date) > 1 ? "\(weeks(from: date)) weeks ago" : "\(weeks(from: date)) week ago"
            }
        }
        if days(from: date)    > 0
        {
            if hours(from: date)   < 24
            {
                return hours(from: date) > 1 ? "\(hours(from: date)) hours ago" : "\(hours(from: date)) hour ago"
            }
            else
            {
                return days(from: date) > 1 ? "\(days(from: date)) days ago" : "\(days(from: date)) day ago"
            }
        }
        if hours(from: date)   > 0
        {
            if minutes(from: date) < 59
            {
                return minutes(from: date) > 1 ? "\(minutes(from: date)) minutes ago" : "\(minutes(from: date)) minute ago"
            }
            else
            {
                return hours(from: date) > 1 ? "\(hours(from: date)) hours ago" : "\(hours(from: date)) hour ago"
            }
        }
        if minutes(from: date) > 0
        {
            if seconds(from: date) < 59
            {
                return seconds(from: date) > 1 ? "\(seconds(from: date)) seconds ago" : "\(seconds(from: date)) second ago"
            }
            else
            {
                return minutes(from: date) > 1 ? "\(minutes(from: date)) minutes ago" : "\(minutes(from: date)) minute ago"
            }
        }
        if seconds(from: date) > 0
        {
            return seconds(from: date) > 1 ? "\(seconds(from: date)) seconds ago" : "\(seconds(from: date)) second ago"
        }
        
        return "just now"
    }
    
    
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   == 1
        {
            return "\(years(from: date)) year"
        }
        else if years(from: date)   > 1
        {
            return "\(years(from: date)) years"
        }
        if months(from: date)  == 1
        {
            return "\(months(from: date)) month"
        }
        else if months(from: date)  > 1
        {
            return "\(months(from: date)) month"
        }
        if weeks(from: date)   == 1
        {
            return "\(weeks(from: date)) week"
        }
        else if weeks(from: date)   > 1
        {
            return "\(weeks(from: date)) weeks"
        }
        if days(from: date)    == 1
        {
            return "\(days(from: date)) day"
        }
        else if days(from: date)    > 1
        {
            return "\(days(from: date)) days"
        }
        if hours(from: date)   == 1
        {
            return "\(hours(from: date)) hour"
        }
        else if hours(from: date)   > 1
        {
            return "\(hours(from: date)) hours"
        }
        if minutes(from: date) == 1
        {
            return "\(minutes(from: date)) minute"
        }
        else if minutes(from: date) > 1
        {
            return "\(minutes(from: date)) minutes"
        }
        return ""
    }
}


extension UIAlertController {
    func changeFont(view:UIView,font:UIFont)
    {
        for item in view.subviews
        {
            if item.isKind(of: UICollectionView.self)
            {
                let col = item as! UICollectionView
                for  row in col.subviews{
                    changeFont(view: row, font: font)
                }
            }
            if item.isKind(of: UILabel.self) {
                let label = item as! UILabel
                label.font = font
            }else {
                changeFont(view: item, font: font)
            }
            
        }
    }
}

extension UILabel{
    
    func underlineText() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
extension Date {
    
    func offsetFrom(date : Date) -> String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);
        
        let seconds = "\(difference.second ?? 0)sec"
        let minutes = "\(difference.minute ?? 0)min" + " " + seconds
        let hours = "\(difference.hour ?? 0)hours" + " " + minutes
        let days = "\(difference.day ?? 0)days" + " " + hours
        
        if let day = difference.day, day          > 0 { return days }
        if let hour = difference.hour, hour       > 0 { return hours }
        if let minute = difference.minute, minute > 0 { return minutes }
        if let second = difference.second, second > 0 { return seconds }
        return ""
    }
    
    
    func addYear(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .year, value: n, to: self)!
    }
    func addMonth(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .month, value: n, to: self)!
    }
    func addDay(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .day, value: n, to: self)!
    }
    func addSec(n: Int) -> Date {
        let cal = NSCalendar.current
        return cal.date(byAdding: .second, value: n, to: self)!
    }
}



extension Array where Element: Numeric {
    /// Returns the total sum of all elements in the array
    var total: Element { return reduce(0, +) }
}

extension Array where Element: BinaryInteger {
    /// Returns the average of all elements in the array
    var average: Double {
        return isEmpty ? 0 : Double(Int(total)) / Double(count)
    }
}

extension Array where Element: FloatingPoint {
    /// Returns the average of all elements in the array
    var average: Element {
        return isEmpty ? 0 : total / Element(count)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}

extension String {
    
    public func isImage() -> Bool {
        // Add here your image formats.
        let imageFormats = ["jpg", "jpeg", "png", "gif"]
        
        if let ext = self.getExtension() {
            return imageFormats.contains(ext)
        }
        
        return false
    }
    
    public func getExtension() -> String? {
        let ext = (self as NSString).pathExtension
        
        if ext.isEmpty {
            return nil
        }
        return ext
    }
    
    public func isURL() -> Bool {
        return URL(string: self) != nil
    }
    
}

extension UILabel {
    func setHTML(html: String) {
        do {
            let at : NSAttributedString = try NSAttributedString(data: html.data(using: .utf8)!, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil);
            self.attributedText =  at;
        } catch {
            self.text = html;
        }
    }
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.underlineStyle, value:NSUnderlineStyle.single.rawValue , range: NSRange(location: 0, length: attributedString.length - 1))
            
            attributedText = attributedString
        }
    }
}

extension NSAttributedString {
    
    convenience init(htmlString html: String, font: UIFont? = nil, useDocumentFontSize: Bool = true) throws {
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        let data = html.data(using: .utf8, allowLossyConversion: true)
        guard (data != nil), let fontFamily = font?.familyName, let attr = try? NSMutableAttributedString(data: data!, options: options, documentAttributes: nil) else {
            try self.init(data: data ?? Data(html.utf8), options: options, documentAttributes: nil)
            return
        }
        
        let fontSize: CGFloat? = useDocumentFontSize ? nil : font!.pointSize
        let range = NSRange(location: 0, length: attr.length)
        attr.enumerateAttribute(.font, in: range, options: .longestEffectiveRangeNotRequired) { attrib, range, _ in
            if let htmlFont = attrib as? UIFont {
                let traits = htmlFont.fontDescriptor.symbolicTraits
                var descrip = htmlFont.fontDescriptor.withFamily(fontFamily)
                
                if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitBold.rawValue) != 0 {
                    descrip = descrip.withSymbolicTraits(.traitBold)!
                }
                
                if (traits.rawValue & UIFontDescriptor.SymbolicTraits.traitItalic.rawValue) != 0 {
                    descrip = descrip.withSymbolicTraits(.traitItalic)!
                }
                
                attr.addAttribute(.font, value: UIFont(descriptor: descrip, size: fontSize ?? htmlFont.pointSize), range: range)
            }
        }
        
        self.init(attributedString: attr)
    }
    
}

extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                application.open(URL(string: url)!, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                return
            }
        }
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}


extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension UIAlertController {
    
    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }
    
    //Set title font and title color
    func setTitlet(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)//1
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : titleFont],//2
                range: NSMakeRange(0, title.utf8.count))
        }
        
        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],//3
                range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")//4
    }
    
    //Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : messageFont],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        
        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }
    
    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
extension UIDatePicker {
    func set18YearValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -18
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -150
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    } }




public class ClickableTextView:UITextView{
    
    var tap:UITapGestureRecognizer!
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        print("init")
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func setup(){
        
        // Add tap gesture recognizer to Text View
        tap = UITapGestureRecognizer(target: self, action: #selector(self.myMethodToHandleTap(sender:)))
        //        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
    @objc func myMethodToHandleTap(sender: UITapGestureRecognizer){
        
        let myTextView = sender.view as! UITextView
        let layoutManager = myTextView.layoutManager
        
        // location of tap in myTextView coordinates and taking the inset into account
        var location = sender.location(in: myTextView)
        location.x -= myTextView.textContainerInset.left;
        location.y -= myTextView.textContainerInset.top;
        
        // character index at tap location
        let characterIndex = layoutManager.characterIndex(for: location, in: myTextView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        // if index is valid then do something.
        if characterIndex < myTextView.textStorage.length {
            
            let orgString = myTextView.attributedText.string
            
            //Find the WWW
            var didFind = false
            var count:Int = characterIndex
            while(count > 2 && didFind == false){
                
                let myRange = NSRange(location: count-1, length: 2)
                let substring = (orgString as NSString).substring(with: myRange)
                //                print(substring,count)
                
                if substring == " w" || (substring  == "w." && count == 3){
                    didFind = true
                    //                    print("Did find",count)
                    
                    var count2 = count
                    while(count2 < orgString.count){
                        
                        let myRange = NSRange(location: count2 - 1, length: 2)
                        let substring = (orgString as NSString).substring(with: myRange)
                        
                        //                        print("Did 2",count2,substring)
                        count2 += 1
                        
                        //If it was at the end of textView
                        if count2  == orgString.count {
                            
                            let length = orgString.count - count
                            let myRange = NSRange(location: count, length: length)
                            
                            let substring = (orgString as NSString).substring(with: myRange)
                            
                            openLink(link: substring)
                            print("It's a Link",substring)
                            return
                        }
                        
                        //If it's in the middle
                        
                        if substring.hasSuffix(" "){
                            
                            let length =  count2 - count
                            let myRange = NSRange(location: count, length: length)
                            
                            let substring = (orgString as NSString).substring(with: myRange)
                            
                            openLink(link: substring)
                            print("It's a Link",substring)
                            return
                        }
                    }
                    return
                }
                
                if substring.hasPrefix(" "){
                    
                    print("Not a link")
                    return
                }
                count -= 1
            }
        }
    }
    
    
    func openLink(link:String){
        
        if let checkURL = URL(string: "http://\(link.replacingOccurrences(of: " ", with: ""))") {
            if UIApplication.shared.canOpenURL(checkURL) {
                UIApplication.shared.open(checkURL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                
                print("url successfully opened")
            }
        } else {
            print("invalid url")
        }
    }
    
    
    public override func didMoveToWindow() {
        if self.window == nil{
            self.removeGestureRecognizer(tap)
            print("ClickableTextView View removed from")
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
    return input.rawValue
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

extension Date {
    
    //MARK:- Get String From Date
    func getStringFromDate(needFormat: String) -> String {
        var dateStr = String()
        if needFormat != "" {
            let formatter = DateFormatter()
            formatter.dateFormat = needFormat
            let locale = Locale.current
            formatter.locale = locale
            dateStr = formatter.string(from: self)
        }
        return dateStr
    }
}

extension String {
    
    //MARK:- Get Date From Sting
    func getDateFromSting(stringFormat: String) -> Date {
        var date = Date()
        if self != "" {
            let formatter = DateFormatter()
            formatter.dateFormat = stringFormat
            let dateInDate = formatter.date(from: self)
            if dateInDate != nil {
                date = dateInDate!
            }
        }
        return date
    }
}
