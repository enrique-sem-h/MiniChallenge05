//
//  UserModel.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 20/05/24.
//

import Foundation

// Esta classe representa o modelo de dados do usuário, que contém informações sobre os hábitos de fumar e conquistas do usuário.
class UserModel {
    var startStreak: Date
    var streakPast: DateInterval
    var recordDate: DateInterval
    var cigarsType: String
    var cigarsPerDay: Int16?
    var cigarettesInPack: Int16?
    var vapePerDay: Int16?
    var smokeCost: Double
    var hourSmoke: [Date]
    var quitDay: Date
    var achievementsList: [UUID]
    
    // MARK: smoker init
    init(startStreak: Date, streakPast: DateInterval = DateInterval(), recordDate: DateInterval = DateInterval(), cigarsType: SmokeType, cigarsPerDay: Int16? = nil, vapePerDay: Int16? = nil, cigarettesInPack: Int16? = nil, smokeCost: Double, hourSmoke: [Date], quitDay: Date, achievementsList: [UUID] = []) {
        self.startStreak = startStreak
        self.streakPast = streakPast
        self.recordDate = recordDate
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
        
        self.cigarsPerDay = cigarsPerDay
        self.cigarettesInPack = cigarettesInPack
        self.vapePerDay = vapePerDay
        self.smokeCost = smokeCost
        self.hourSmoke = hourSmoke
        self.quitDay = quitDay
        self.achievementsList = achievementsList
    }
    
    enum SmokeType: String {
        case eCigarette
        case cigarette
    }
}
