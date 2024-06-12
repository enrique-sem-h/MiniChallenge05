//
//  UserModel.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 20/05/24.
//

import Foundation

/// The `UserModel` class represents a user's smoking data and achievements.
///
/// ## How to use?
///
/// You can initialize a `UserModel` with the relevant user data and use its properties to access and modify the user's smoking information and achievements.
///
/// ```swift
/// let user = UserModel(
///     startStreak: Date(),
///     streakPast: DateInterval(),
///     recordDate: DateInterval(),
///     cigarsType: .cigarette,
///     cigarsPerDay: 20,
///     vapePerDay: nil,
///     cigarettesInPack: 20,
///     smokeCost: 10.0,
///     hourSmoke: [Date()],
///     quitDay: Date(),
///     achievementsList: [UUID()]
/// )
/// ```
///
/// You can then access and modify the user's data:
///
/// ```swift
/// print(user.startStreak)
/// user.cigarsPerDay = 15
/// user.updateSmokeCost(newCost: 12.0)
/// ```
///
/// - Properties:
///   - `startStreak`: The date the user started their streak.
///   - `streakPast`: The user's past streaks as a `DateInterval`.
///   - `recordDate`: The user's record streak as a `DateInterval`.
///   - `cigarsType`: The type of cigars the user smokes, either `.cigarette` or `.eCigarette`.
///   - `cigarsPerDay`: The number of cigars the user smokes per day (optional).
///   - `cigarettesInPack`: The number of cigarettes in a pack (optional).
///   - `vapePerDay`: The number of times the user vapes per day (optional).
///   - `smokeCost`: The cost of the user's smoking habit.
///   - `hourSmoke`: The hours at which the user smokes.
///   - `quitDay`: The date the user quit smoking.
///   - `achievementsList`: A list of achievements the user has earned, represented as UUIDs.
///
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

    /// Initializes a new `UserModel` with the given parameters.
    ///
    /// - Parameters:
    ///   - startStreak: The date the user started their streak.
    ///   - streakPast: The user's past streaks as a `DateInterval`.
    ///   - recordDate: The user's record streak as a `DateInterval`.
    ///   - cigarsType: The type of cigars the user smokes, either `.cigarette` or `.eCigarette`.
    ///   - cigarsPerDay: The number of cigars the user smokes per day (optional).
    ///   - vapePerDay: The number of times the user vapes per day (optional).
    ///   - cigarettesInPack: The number of cigarettes in a pack (optional).
    ///   - smokeCost: The cost of the user's smoking habit.
    ///   - hourSmoke: The hours at which the user smokes.
    ///   - quitDay: The date the user quit smoking.
    ///   - achievementsList: A list of achievements the user has earned, represented as UUIDs.
    init(
        startStreak: Date,
        streakPast: DateInterval = DateInterval(),
        recordDate: DateInterval = DateInterval(),
        cigarsType: SmokeType,
        cigarsPerDay: Int16? = nil,
        vapePerDay: Int16? = nil,
        cigarettesInPack: Int16? = nil,
        smokeCost: Double,
        hourSmoke: [Date],
        quitDay: Date,
        achievementsList: [UUID] = []
    ) {
        self.startStreak = startStreak
        self.streakPast = streakPast
        self.recordDate = recordDate
        self.cigarsType = cigarsType.rawValue

        if cigarsType == .cigarette {
            self.cigarsPerDay = cigarsPerDay
        } else {
            self.cigarsPerDay = nil
        }

        if cigarsType == .cigarette {
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

    /// The type of smoking product the user uses.
    ///
    /// - `.eCigarette`: Represents an e-cigarette.
    /// - `.cigarette`: Represents a regular cigarette.
    enum SmokeType: String {
        case eCigarette
        case cigarette
    }
}

