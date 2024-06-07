//
//  User.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation
import CoreData


// Esta classe representa um usuário no contexto do Core Data.
// Inclui propriedades que armazenam informações sobre o hábito de fumar e vape do usuário,
// como o número de cigarros fumados por dia, o tipo de cigarro, o custo do hábito,
// datas relacionadas a quando o usuário fuma, e conquistas associadas.
@objc(User)
class User: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var achievementsList: [UUID]?
    @NSManaged public var cigarettesInPack: Int16
    @NSManaged public var cigarsPerDay: Int16
    @NSManaged public var cigarsType: String?
    @NSManaged public var hourSmoke: [Date]?
    @NSManaged public var quitDay: Date?
    @NSManaged public var recordDate: DateInterval?
    @NSManaged public var smokeCost: Double
    @NSManaged public var startStreak: Date?
    @NSManaged public var streakPast: DateInterval?
    @NSManaged public var vapePerDay: Int16
    
}
