//
//  UserModel.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 20/05/24.
//

import Foundation

struct UserModel {
    var streakStart: Date
    var lastStreak: DateInterval
    var recordDate: DateInterval
    var smokeType: String
    var dailyCigaretteAmount: Int?
    var cigarettesInPack: Int?
    var smokeCost: Double
    var smokingTimes: [Date]
    var quitDay: Date
    var achievementsList: [UUID]
    
    // MARK: smoker init
    init(streakStart: Date, smokeType: SmokeType, dailyCigaretteAmount: Int? = nil, cigarettesInPack: Int? = nil, smokeCost: Double, smokingTimes: [Date], quitDay: Date) {
        self.streakStart = streakStart
        self.lastStreak = DateInterval()
        self.recordDate = DateInterval()
        self.smokeType = smokeType.rawValue
        
        if smokeType == SmokeType.cigarette{
            self.dailyCigaretteAmount = dailyCigaretteAmount
        } else {
            self.dailyCigaretteAmount = nil
        }
        
        if smokeType == SmokeType.cigarette{
            self.cigarettesInPack = cigarettesInPack
        } else {
            self.cigarettesInPack = nil
        }
        
        self.smokeCost = smokeCost
        self.smokingTimes = smokingTimes
        self.quitDay = quitDay
        self.achievementsList = []
    }
    
    enum SmokeType: String {
        case eCigarette
        case cigarette
    }
}
