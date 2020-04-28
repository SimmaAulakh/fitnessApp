//
//  RemindersVC.swift
//  Grrind Fitness
//
//  Created by user on 27/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//
import UserNotifications
import UIKit

class RemindersVC: UIViewController {


    @IBOutlet weak var remindersTableView: UITableView!
    
    var models = [myReminder]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        remindersTableView.delegate = self
        remindersTableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction  func didTapAdd() {
        
      guard let vc = storyboard?.instantiateViewController(identifier: "AddRemindersVC")as? AddRemindersVC else{
            return
        }
        vc.title = "New Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { title, body, date in
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = myReminder(title: title, date: date, identifier: "id_\(title)")
                self.models.append(new)
                self.remindersTableView.reloadData()
                
                let content = UNMutableNotificationContent()
                      content.title  = title
                      content.sound = .default
                      content.body = body
                      
                      let targetDate = date
                      let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
                      
                      let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                      UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
                      if error != nil{
                          print("something went wrong")
                          }
                      })
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction  func didTapTest(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge,.sound], completionHandler: {success , error in
            if success{
                self.scheduleTest()
            }else if  error != nil{
                print("error occurred")
            }
        })
        
    }
    func scheduleTest(){
        
        let content = UNMutableNotificationContent()
        content.title  = "hello world"
        content.sound = .default
        content.body = "my long body , my long body"
        
        let targetDate = Date().addingTimeInterval(10)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
        if error != nil{
            print("something went wrong")
            }
        })
    }
}
extension RemindersVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        remindersTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension RemindersVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = remindersTableView.dequeueReusableCell(withIdentifier: "RemindersCell", for:indexPath) as? RemindersCell
        cell?.reminderName.text = models[indexPath.row].title
        let date = models[indexPath.row].date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        cell?.time.text = formatter.string(from: date)
        return cell!
    }
}

struct myReminder {
    let title: String
    let date: Date
    let identifier: String
}
