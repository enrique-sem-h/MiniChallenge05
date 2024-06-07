//
//  File.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation
import SwiftUI

/// The `AchievementModel` class represents an achievement that a user can earn.
///
/// ## How to use?
///
/// You can initialize an `AchievementModel` with the relevant achievement data and use its properties to access and modify the achievement's details.
///
/// ```swift
/// let achievement = AchievementModel(
///     title: "First Day",
///     description: "Complete your first day without smoking",
///     daysToAchieve: .firstDay,
///     imageName: "firstDayImage"
/// )
/// ```
///
/// You can then access and modify the achievement's data:
///
/// ```swift
/// print(achievement.title)
/// print(achievement.evaluateProgress())
/// ```
///
/// - Properties:
///   - `progress`: The progress towards achieving the goal, as a Float value.
///   - `title`: The title of the achievement.
///   - `description`: The description of the achievement.
///   - `wasConquered`: A Boolean value indicating whether the achievement was conquered.
///   - `daysToAchieve`: The number of days required to achieve the goal.
///   - `id`: The unique identifier for the achievement.
///   - `image`: The image associated with the achievement, if any.
///
class AchievementModel {
    var progress: Float = 0.0
    let title: String
    let description: String
    var wasConquered: Bool = false
    let daysToAchieve: Int
    var id: UUID
    let image: UIImage?

    /// Initializes a new `AchievementModel` with the given parameters.
    ///
    /// - Parameters:
    ///   - title: The title of the achievement.
    ///   - description: The description of the achievement.
    ///   - daysToAchieve: The number of days required to achieve the goal.
    ///   - imageName: The name of the image associated with the achievement.
    init(title: String, description: String, daysToAchieve: AchievementCases, imageName: String) {
        self.title = title
        self.description = description
        self.id = UUID()
        self.daysToAchieve = daysToAchieve.rawValue

        self.image = UIImage(named: imageName) ?? nil

        self.progress = evaluateProgress()
    }
}

extension AchievementModel {

    /// Returns the number of days since the user started their streak.
    ///
    /// - Returns: The number of days since the streak started, as an optional Int.
    func getStreakDays() -> Int? {
        var startStreak = Date()
        let calendar = Calendar.current
        if let twoDaysAgo = calendar.date(byAdding: .day, value: -2, to: Date()) {
            startStreak = twoDaysAgo
        }
        let daysElapsed = calendar.dateComponents([.day], from: startStreak, to: .now).day
        return daysElapsed
    }

    /// Evaluates the progress towards achieving the goal.
    ///
    /// - Returns: The progress as a Float value.
    func evaluateProgress() -> Float {
        if self.wasConquered {
            return 1.0
        }

        guard let streakDays = getStreakDays() else { return 0.0 }

        if streakDays >= daysToAchieve {
            return 1.0
        }

        self.progress = Float(streakDays) / Float(daysToAchieve)

        print(self.progress)

        return self.progress
    }
}
