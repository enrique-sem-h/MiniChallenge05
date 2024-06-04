//
//  NotificationHandler.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 24/05/24.
//

import UserNotifications
import Foundation

final class LocalNotifications: NSObject {
    
    static let localNotification = LocalNotifications()
    private let smokedActionIdentifier: String = "SmokedID"
    private let notSmokedActionIdentifier: String = "NotSmokedID"
    private let categoryIdentifier: String = "categoryID"
    
    override init() {
        super.init()
        requestPermission { [weak self] granted in
            if !granted {
                //Deal with the error
            }
        }
    }
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        let current = UNUserNotificationCenter.current()
        current.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Success in notification authorization")
                completion(true)
            } else {
                print("Failure in notification authorization")
                completion(false)
            }
        }
        
        let smokedButton = UNNotificationAction(identifier: smokedActionIdentifier, title: "Fumei")
        let notSmokedButton = UNNotificationAction(identifier: notSmokedActionIdentifier, title: "Não Fumei")
        let category = UNNotificationCategory(identifier: categoryIdentifier, actions: [smokedButton, notSmokedButton], intentIdentifiers: [])
        
        current.setNotificationCategories([category])
        current.delegate = self
    }
    
    func schedule() {
        
        let smokeHours = DataManager.shared.userModel?.hourSmoke
        
        let current = UNUserNotificationCenter.current()
        
        //Remove all notifications
        current.removeAllPendingNotificationRequests()
        current.removeAllDeliveredNotifications()
        
        current.getNotificationSettings { [self] settings in
            guard settings.alertSetting == .enabled else { return }
            
            guard let smokedHours = smokeHours else {return}
            
            let dispatchedGroup = DispatchGroup()
            
            for smokeHour in smokedHours {
                
                let content = UNMutableNotificationContent()
                content.title = "Notificação da pitada"
                content.subtitle = "Responda: "
                content.body = "Você fumou ? :((("
                content.categoryIdentifier = self.categoryIdentifier
                
                let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: smokeHour)

                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                current.add(request) { error in
                    if let error = error {
                        print("Error adding notification: \(error.localizedDescription)")
                    }
                }
            }            
            
        }
    }
    
}

extension LocalNotifications: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) -> UNNotificationPresentationOptions {
        return [.banner, .sound]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == smokedActionIdentifier {
            DataManager.shared.resetStreak()
        } else if response.actionIdentifier == notSmokedActionIdentifier {
            //Colocar as ações a serem feitas quando ele não fumar
        }
        
        completionHandler()
    }
}





