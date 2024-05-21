//
//  User+CoreDataProperties.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 20/05/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var achievementsList: [UUID]?
    @NSManaged public var cigarettesInPack: Int16
    @NSManaged public var cigarsPerDay: Int16
    @NSManaged public var cigarsType: String?
    @NSManaged public var hourSmoke: [Date]?
    @NSManaged public var id: UUID?
    @NSManaged public var quitDay: Date?
    @NSManaged public var recordDate: DateInterval?
    @NSManaged public var smokeCost: Double
    @NSManaged public var startStreak: Date?
    @NSManaged public var streakPast: DateInterval?

}

extension User : Identifiable {

}
