//
//  OnboardingUser.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 22/05/24.
//

import Foundation

class UserPreferences {
    var smokingType: UserModel.SmokeType
    var cigarsPerDay: Int?
    var cigarettesInPack: Int?
    var vapePerDay: Int?
    var smokeCost: Double
    var hourSmoke: [Date]
    
    init() {
        self.smokingType = .cigarette
        self.smokeCost = 0
        self.hourSmoke = []
    }
}
