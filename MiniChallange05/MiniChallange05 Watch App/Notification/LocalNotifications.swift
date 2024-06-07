//
//  NotificationHandler.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 24/05/24.
//

import UserNotifications
import Foundation

/// Manages local notifications for the MiniChallange05 Watch App.
final class LocalNotifications: NSObject {
    
    /// Shared instance of LocalNotifications.
    static let localNotification = LocalNotifications()
    
    /// Identifier for the action triggered when the user smoked.
    private let smokedActionIdentifier: String = Texts.Keys.smokedID.rawValue
    
    /// Identifier for the action triggered when the user did not smoke.
    private let notSmokedActionIdentifier: String = Texts.Keys.notSmokedID.rawValue
    
    /// Identifier for the notification category.
    private let categoryIdentifier: String = Texts.Keys.categoryID.rawValue
    
    /// Initializes LocalNotifications and requests user permission for notifications.
    override init() {
        super.init()
        requestPermission { [weak self] granted in
            if !granted {
                // Deal with the error
            }
        }
    }
    
    /// Requests user permission for notifications.
    /// - Parameter completion: A closure to be executed when the request is completed, providing a Boolean value indicating whether the permission was granted.
    func requestPermission(completion: @escaping (Bool) -> Void) {
        let current = UNUserNotificationCenter.current()
        current.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
        
        let smokedButton = UNNotificationAction(identifier: smokedActionIdentifier, title: Texts.notificationYes)
        let notSmokedButton = UNNotificationAction(identifier: notSmokedActionIdentifier, title: Texts.notificationNo)
        let category = UNNotificationCategory(identifier: categoryIdentifier, actions: [smokedButton, notSmokedButton], intentIdentifiers: [])
        
        current.setNotificationCategories([category])
        current.delegate = self
    }
    
    /// Schedules notifications based on user-defined smoking hours.
    func schedule() {
        
        let smokeHours = DataManager.shared.userModel?.hourSmoke
        
        let current = UNUserNotificationCenter.current()
        
        // Remove all notifications
        current.removeAllPendingNotificationRequests()
        current.removeAllDeliveredNotifications()
        
        current.getNotificationSettings { [self] settings in
            guard settings.alertSetting == .enabled else { return }
            
            guard let smokedHours = smokeHours else {return}
            
            let dispatchedGroup = DispatchGroup()
            
            for smokeHour in smokedHours {
                
                let content = UNMutableNotificationContent()
                content.title = Texts.contentTitle
                content.subtitle = ""
                content.body = Texts.contentBody
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

// MARK: - UNUserNotificationCenterDelegate

extension LocalNotifications: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) -> UNNotificationPresentationOptions {
        return [.banner, .sound]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == smokedActionIdentifier {
            DataManager.shared.resetStreak()
        } else if response.actionIdentifier == notSmokedActionIdentifier {
            // Place actions to be performed when the user did not smoke
        }
        
        completionHandler()
    }
}

