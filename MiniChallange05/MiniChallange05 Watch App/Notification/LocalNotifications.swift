//
//  NotificationHandler.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 24/05/24.
//

import UserNotifications
import Foundation

final class LocalNotifications : NSObject{
    let smokeHours = DataManager.shared.userModel?.hourSmoke
    private let actionIdentifier : String = "actionID"
    private let categoryIdentifier : String = "categoryID"
    
    override init() {
        super.init()
        
        Task{
            do{
                requestPermission()
                try await schedule()
            }catch{
                print("\(error.localizedDescription)")
            }
        }
    }
    
    
    func requestPermission(){
        let current = UNUserNotificationCenter.current()
        current.requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
            if success {
                print("Succsess in notiicatino authorization")
            }else{
                print("Failure in notiicatino authorization")
            }
        }
        
        let action = UNNotificationAction(identifier: actionIdentifier, title: "teste")
        let category = UNNotificationCategory(identifier: categoryIdentifier, actions: [action], intentIdentifiers: [])
        
        current.setNotificationCategories([category])
        current.delegate = self
        
    }
    
    func schedule() async throws{
        let current = UNUserNotificationCenter.current()
        let settings = await current.notificationSettings()
        
        guard settings.alertSetting == .enabled else {return}
        
        let content = UNMutableNotificationContent()
        content.title = "Teste titulo"
        content.subtitle = "Teste subtitle"
        content.body = "Teste de body"
        
        let components = DateComponents(second: 3)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        try await current.add(request)
    }
    
}


extension LocalNotifications : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.list, .sound ]
    }
}
