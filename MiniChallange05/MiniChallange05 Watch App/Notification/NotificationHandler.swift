//
//  NotificationHandler.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 24/05/24.
//

import UserNotifications

struct NotificationHandler{
    let smokeHours = DataManager.shared.userModel?.hourSmoke
    
    func setNotifications(){
        requestPermission()
        
        let content = UNMutableNotificationContent()
        content.title = "Teste da primeira notificação"
        content.subtitle = "Bro"
        
        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        let request1 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger1)
        UNUserNotificationCenter.current().add(request1) { error in
            if let error = error {
                print("Error adding notification request: \(error.localizedDescription)")
            } else {
                print("Notification request added successfully")
            }
        }
    }
    
    
    func requestPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
            if success {
                print("Succsess in notiicatino authorization")
            }else{
                print("Failure in notiicatino authorization")
            }
        }
    }
    
}
