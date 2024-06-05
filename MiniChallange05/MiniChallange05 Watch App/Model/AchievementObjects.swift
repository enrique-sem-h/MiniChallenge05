//
//  AchievementObjects.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 05/06/24.
//

import Foundation


struct AchievementObjects{
    
    private let firstDayInfo = AchievementModel(title: "First Day without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .firstDay, imageName: "TimeBased")
    
    private let firstWeekInfo = AchievementModel(title: "First Week without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .firstWeek, imageName: "TimeBased")
    
    private let halfMontInfo = AchievementModel(title: "Half month without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .halfMonth, imageName: "TimeBased")
    
    private let firstMonthInfo = AchievementModel(title: "First month without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .month, imageName: "TimeBased")
    
    private let threeMonthsInfo = AchievementModel(title: "Three Week without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .threeMonths, imageName: "TimeBased")
    
    private let halfYearInfo = AchievementModel(title: "Half year without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .halfYear, imageName: "TimeBased")
    
    private let oneYearInfo = AchievementModel(title: "First year without smoke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .year, imageName: "TimeBased")
    
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
