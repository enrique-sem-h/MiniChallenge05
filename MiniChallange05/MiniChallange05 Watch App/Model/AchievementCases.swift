//
//  AchievementCases.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 03/06/24.
//

import Foundation

/// The `AchievementCases` enum represents different milestones a user can achieve on their journey.
///
/// ## How to use?
///
/// You can use these cases to check which milestones a user has reached based on the number of days they have been on their journey.
///
/// ```swift
/// let milestone = AchievementCases(rawValue: daysOnJourney)
/// switch milestone {
/// case .startJourney:
///     // Handle start journey case
/// case .firstDay:
///     // Handle first day case
/// case .firstWeek:
///     // Handle first week case
/// case .halfMonth:
///     // Handle half month case
/// case .month:
///     // Handle month case
/// case .threeMonths:
///     // Handle three months case
/// case .halfYear:
///     // Handle half year case
/// case .year:
///     // Handle year case
/// default:
///     // Handle default case
/// }
/// ```
///
/// Each case represents a specific number of days:
/// - `startJourney` represents 0 days.
/// - `firstDay` represents 1 day.
/// - `firstWeek` represents 7 days.
/// - `halfMonth` represents 15 days.
/// - `month` represents 30 days.
/// - `threeMonths` represents 90 days.
/// - `halfYear` represents 183 days.
/// - `year` represents 365 days.
///
enum AchievementCases : Int{
    case startJourney = 0
    case firstDay = 1
    case firstWeek = 7
    case halfMonth = 15
    case month = 30
    case threeMonths = 90
    case halfYear = 183
    case year = 365
}
