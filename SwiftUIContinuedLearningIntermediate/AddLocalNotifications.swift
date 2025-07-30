//
//  AddLocalNotifications.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 30.07.2025.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager{
    
    static let instance = NotificationManager() // singleton
    
    
    //request to send notifications
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("success")
            }
        }
    }
    
    
    
    func scheduleNotification(){
        let content  = UNMutableNotificationContent()
        content.title = "This is the first notification"
        content.subtitle = "It is easy"
        content.sound = .default
        content.badge = 1
        
        
        // triggers:
        // time
        
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 15
//        dateComponents.minute = 31
////        dateComponents.weekday = 2
//    
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //location
        
        let coordinates = CLLocationCoordinate2D(
            //location
            latitude: 40.00,
            longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        
        region.notifyOnExit = true
        region.notifyOnEntry = false
        
        let trigger = UNLocationNotificationTrigger(region: region , repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func cancleNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests() //cancel upcoming ones
        UNUserNotificationCenter.current().removeAllDeliveredNotifications() // on Iphone Lock Screen
    }
}

struct AddLocalNotifications: View {
    var body: some View {
        VStack(spacing:40){
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notification ") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cance notification ") {
                NotificationManager.instance.cancleNotification()
            }
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    AddLocalNotifications()
}
