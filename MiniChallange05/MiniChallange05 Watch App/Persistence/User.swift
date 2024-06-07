//
//  User.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation
import CoreData

/// Represents a user entity in Core Data.
@objc(User)
class User: NSManagedObject {
    
    /// Returns a fetch request for the User entity.
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    /// List of achievements associated with the user.
    @NSManaged public var achievementsList: [UUID]?
    
    /// Number of cigarettes in a pack for the user.
    @NSManaged public var cigarettesInPack: Int16
    
    /// Number of cigars per day for the user.
    @NSManaged public var cigarsPerDay: Int16
    
    /// Type of cigars for the user.
    @NSManaged public var cigarsType: String?
    
    /// List of smoking hours for the user.
    @NSManaged public var hourSmoke: [Date]?
    
    /// Date when the user quit smoking.
    @NSManaged public var quitDay: Date?
    
    /// Record date interval for the user.
    @NSManaged public var recordDate: DateInterval?
    
    /// Cost of smoking for the user.
    @NSManaged public var smokeCost: Double
    
    /// Start date of the smoking streak for the user.
    @NSManaged public var startStreak: Date?
    
    /// Past streak date interval for the user.
    @NSManaged public var streakPast: DateInterval?
    
    /// Number of vapes per day for the user.
    @NSManaged public var vapePerDay: Int16
    
}

