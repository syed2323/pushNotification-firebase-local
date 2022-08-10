//
//  ViewController.swift
//  pushNotification
//
//  Created by Syed Abdul Ahad on 8/10/22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    var noOfnotification = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (success, error)  in
            
        }
    }
    
    @IBAction func btnLoacalNotificationClick (_ sender: UIButton) {
        print("button click")
        noOfnotification = noOfnotification + 1
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "My Catgory Identifier"
        content.title = "local notification"
        content.body = "This is created example"
        content.badge = noOfnotification as NSNumber
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        let identifier = "Main identifier"
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in

            print("error : \(error?.localizedDescription)")
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

