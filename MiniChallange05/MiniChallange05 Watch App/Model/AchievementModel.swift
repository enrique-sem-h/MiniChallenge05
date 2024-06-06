//
//  File.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation
import SwiftUI


class AchievementModel{
    var progress : Float = 0.0
    let title : String
    let description : String
    var wasConquered : Bool = false
    let daysToAchieve : Int
    var id : UUID
    let image : UIImage?
    
    init(title: String, description: String, daysToAchieve : AchievementCases, imageName : String) {
        self.title = title
        self.description = description
        self.id = UUID()
        self.daysToAchieve = daysToAchieve.rawValue
        
        self.image = UIImage(named: imageName) ?? nil
        
        self.progress = evaluateProgress()
    }
}

extension AchievementModel{
    
    //Get the current period in the streak to check wich achievement should be released
    func getStreakDays() -> Int?{
//        guard let startStreak = DataManager.shared.userEntity?.startStreak else {return 0}
        var startStreak = Date()
        let calendar = Calendar.current
        if let twoDaysAgo = calendar.date(byAdding: .day, value: -2, to: Date()){
            startStreak = twoDaysAgo
        }
        let daysElapsed =  calendar.dateComponents([.day], from: startStreak, to: .now).day
        return daysElapsed
    }
    
    func evaluateProgress() -> Float{
        if self.wasConquered{
            return 1.0
        }
        
        guard let streakDays = getStreakDays() else {return 0.0}
        
        if (streakDays >= daysToAchieve){
            return 1.0
        }
        
        self.progress = Float(streakDays)/Float(daysToAchieve)
        
        print(self.progress)
       
        return self.progress
    }
}
