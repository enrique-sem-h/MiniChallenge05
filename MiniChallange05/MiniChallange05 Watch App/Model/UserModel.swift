//
//  UserModel.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 20/05/24.
//

import Foundation

class UserModel {
    var startStreak: Date
    var streakPast: DateInterval
    var recordDate: DateInterval
    var cigarsType: String
    var cigarsPerDay: Int?
    var cigarettesInPack: Int?
    var smokeCost: Double
    var hourSmoke: [Date]
    var quitDay: Date
    var achievementsList: [UUID]
    
    // MARK: smoker init
    init(startStreak: Date, cigarsType: SmokeType, cigarsPerDay: Int? = nil, cigarettesInPack: Int? = nil, smokeCost: Double, hourSmoke: [Date], quitDay: Date) {
        self.startStreak = startStreak
        self.streakPast = DateInterval()
        self.recordDate = DateInterval()
        self.cigarsType = cigarsType.rawValue
        
        if cigarsType == SmokeType.cigarette{
            self.cigarsPerDay = cigarsPerDay
        } else {
            self.cigarsPerDay = nil
        }
        
        if cigarsType == SmokeType.cigarette{
            self.cigarettesInPack = cigarettesInPack
        } else {
            self.cigarettesInPack = nil
        }
        
        self.smokeCost = smokeCost
        self.hourSmoke = hourSmoke
        self.quitDay = quitDay
        self.achievementsList = []
    }
    
    enum SmokeType: String {
        case eCigarette
        case cigarette
    }
    
    
}
