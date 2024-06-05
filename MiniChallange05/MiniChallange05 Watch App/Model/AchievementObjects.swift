//
//  AchievementObjects.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 05/06/24.
//

import Foundation


struct AchievementObjects{
    
    private let firstDayInfo = AchievementModel(title: String(localized: "firstDayInfoTitle", defaultValue: "Fresh Start"), description: String(localized: "firstDayInfoDescription", defaultValue: "You've just completed your first day of a brand new streak without smoking. Hang in there!"), daysToAchieve: .firstDay, imageName: "TimeBased")
    
    private let firstWeekInfo = AchievementModel(title: String(localized: "firstWeekInfoTitle", defaultValue: "Brand New Streak"), description: String(localized: "firstWeekInfoDescription", defaultValue: "Congratulations! You   completed your first week without smoking. Celebrate this achievement with your loved ones, and keep up the good work!"), daysToAchieve: .firstWeek, imageName: "TimeBased")
    
    private let halfMontInfo = AchievementModel(title: String(localized: "halfMontInfoTitle", defaultValue:  "15 Days Streak"), description: String(localized: "halfMontInfoDescription", defaultValue: "You have reached 15 days in your streak! You're halfway through your first month, keep it up!") , daysToAchieve: .halfMonth, imageName: "TimeBased")
    
    private let firstMonthInfo = AchievementModel(title: String(localized: "firstMonthInfoTitle", defaultValue: "1 Month Streak"), description: String(localized: "firstMonthInfoDescription", defaultValue: "You completed a whole month without working. Good job! Celebrate this achievement by taking a moment to reflect on how far you've come, and on the changes you've gone through. You're doing great! Keep going.") , daysToAchieve: .halfMonth, imageName: "TimeBased")
    
    private let threeMonthsInfo = AchievementModel(title: String(localized: "threeMonthsInfoTitle", defaultValue:  "3 Months Streak"), description: String(localized: "threeMonthsInfoDescription", defaultValue: "You reached a 3 months streak. Congraulations, keep up the great work!") , daysToAchieve: .halfMonth, imageName: "TimeBased")
    
    private let halfYearInfo = AchievementModel(title: String(localized: "halfYearInfoTitle", defaultValue:  "6 Months Streak"), description: String(localized: "halfYearInfoDescription", defaultValue: "You reached a 6 months streak. Congraulations, keep up the great work!") , daysToAchieve: .halfMonth, imageName: "TimeBased")
    
    private let oneYearInfo = AchievementModel(title: String(localized: "oneYearInfoTitle", defaultValue:  "1 Year Streak"), description: String(localized: "oneYearInfoDescription", defaultValue: "You reached a 1 year streak. Congraulations, keep up the great work!") , daysToAchieve: .halfMonth, imageName: "TimeBased")
    
    var achievementObjects : [AchievementModel]
    
    init() {
        self.achievementObjects = [firstDayInfo, firstWeekInfo, halfMontInfo, firstMonthInfo, threeMonthsInfo, halfYearInfo, oneYearInfo]
        self.achievementObjects[0].wasConquered = true
    }
    
    func separeAchievementObjects( released : inout [AchievementModel], unreleased : inout [AchievementModel]){
        for object in achievementObjects {
            if object.wasConquered{
                released.append(object)
            }else{
                unreleased.append(object)
            }
        }
    }
}
