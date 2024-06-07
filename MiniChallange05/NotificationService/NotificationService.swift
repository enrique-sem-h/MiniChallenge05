//
//  NotificationService.swift
//  NotificationService
//
//  Created by Kaua Miguel on 24/05/24.
//

import UserNotifications

/// Service class responsible for handling notification extensions.
class NotificationService: UNNotificationServiceExtension {

    /// The content handler closure to modify the notification content.
    var contentHandler: ((UNNotificationContent) -> Void)?
    
    /// The mutable notification content for modification.
    var bestAttemptContent: UNMutableNotificationContent?

    /// Called when the service receives a notification request.
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
            contentHandler(bestAttemptContent)
        }
    }
    
    /// Called when the service's time is about to expire.
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}

