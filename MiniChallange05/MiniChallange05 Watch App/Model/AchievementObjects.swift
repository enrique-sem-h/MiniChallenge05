//
//  AchievementObjects.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 05/06/24.
//

import Foundation

/// This structure defines the available achievement objects within the application and handles the release of achievements based on the user's progress.
///
/// ## Properties
/// - `firstDayInfo`: The achievement model for completing the first day without smoking.
/// - `firstWeekInfo`: The achievement model for completing the first week without smoking.
/// - `halfMontInfo`: The achievement model for completing 15 days without smoking.
/// - `firstMonthInfo`: The achievement model for completing the first month without smoking.
/// - `threeMonthsInfo`: The achievement model for completing three months without smoking.
/// - `halfYearInfo`: The achievement model for completing six months without smoking.
/// - `oneYearInfo`: The achievement model for completing one year without smoking.
/// - `achievementObjects`: An array of `AchievementModel` objects representing all achievements.
///
/// ## Methods
/// - `init()`: Initializes the `AchievementObjects` structure and releases achievements based on progress.
/// - `separeAchievementObjects(released:unreleased:)`: Separates the achievements into released and unreleased categories based on whether they have been achieved.
/// - `releaseArchievment()`: Releases achievements based on the number of days the user has maintained their streak.
struct AchievementObjects {
    private let firstDayInfo = AchievementModel(
        title: String(localized: "firstDayInfoTitle", defaultValue: "Fresh Start"),
        description: String(localized: "firstDayInfoDescription", defaultValue: "You've just completed your first day of a brand new streak without smoking. Hang in there!"),
        daysToAchieve: .firstDay,
        imageName: "TimeBased"
    )
    
    private let firstWeekInfo = AchievementModel(
        title: String(localized: "firstWeekInfoTitle", defaultValue: "1 Week Streak"),
        description: String(localized: "firstWeekInfoDescription", defaultValue: "Congratulations! You completed your first week without smoking. Celebrate this achievement with your loved ones, and keep up the good work!"),
        daysToAchieve: .firstWeek,
        imageName: "TimeBased"
    )
    
    private let halfMontInfo = AchievementModel(
        title: String(localized: "halfMontInfoTitle", defaultValue: "15 Days Streak"),
        description: String(localized: "halfMontInfoDescription", defaultValue: "You have reached 15 days in your streak! You're halfway through your first month, keep it up!"),
        daysToAchieve: .halfMonth,
        imageName: "TimeBased"
    )
    
    private let firstMonthInfo = AchievementModel(
        title: String(localized: "firstMonthInfoTitle", defaultValue: "1 Month Streak"),
        description: String(localized: "firstMonthInfoDescription", defaultValue: "You completed a whole month without smoking. Good job! Celebrate this achievement by taking a moment to reflect on how far you've come, and on the changes you've gone through. You're doing great! Keep going."),
        daysToAchieve: .halfMonth,
        imageName: "TimeBased"
    )
    
    private let threeMonthsInfo = AchievementModel(
        title: String(localized: "threeMonthsInfoTitle", defaultValue: "3 Months Streak"),
        description: String(localized: "threeMonthsInfoDescription", defaultValue: "You reached a 3 months streak. Congratulations, keep up the great work!"),
        daysToAchieve: .halfMonth,
        imageName: "TimeBased"
    )
    
    private let halfYearInfo = AchievementModel(
        title: String(localized: "halfYearInfoTitle", defaultValue: "6 Months Streak"),
        description: String(localized: "halfYearInfoDescription", defaultValue: "You reached a 6 months streak. Congratulations, keep up the great work!"),
        daysToAchieve: .halfMonth,
        imageName: "TimeBased"
    )
    
    private let oneYearInfo = AchievementModel(
        title: String(localized: "oneYearInfoTitle", defaultValue: "1 Year Streak"),
        description: String(localized: "oneYearInfoDescription", defaultValue: "You reached a 1 year streak. Congratulations, keep up the great work!"),
        daysToAchieve: .halfMonth,
        imageName: "TimeBased"
    )
    
    var achievementObjects: [AchievementModel]
    
    /// Initializes the `AchievementObjects` structure and releases achievements based on progress.
    init() {
        self.achievementObjects = [firstDayInfo, firstWeekInfo, halfMontInfo, firstMonthInfo, threeMonthsInfo, halfYearInfo, oneYearInfo]
        releaseArchievment()
    }
    
    /// Separates the achievements into released and unreleased categories based on whether they have been achieved.
    ///
    /// - Parameters:
    ///   - released: An array to store the released achievements.
    ///   - unreleased: An array to store the unreleased achievements.
    func separeAchievementObjects(released: inout [AchievementModel], unreleased: inout [AchievementModel]) {
        for object in achievementObjects {
            if object.wasConquered {
                released.append(object)
            } else {
                unreleased.append(object)
            }
        }
    }
    
    /// Releases achievements based on the number of days the user has maintained their streak.
    func releaseArchievment() {
        guard let daysElapsed = self.achievementObjects[0].getStreakDays() else { return }
        
        switch daysElapsed {
        case 1...6:
            self.achievementObjects[0].wasConquered = true
        case 7...14:
            self.achievementObjects[1].wasConquered = true
        case 15...29:
            self.achievementObjects[2].wasConquered = true
        case 30...59:
            self.achievementObjects[3].wasConquered = true
        case 60...182:
            self.achievementObjects[4].wasConquered = true
        case 183...364:
            self.achievementObjects[5].wasConquered = true
        case 364...400:
            self.achievementObjects[6].wasConquered = true
        default:
            print("Non case was executed")
        }
    }
}
