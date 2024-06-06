//
//  Texts.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 03/06/24.
//

import Foundation
import SwiftUI

struct Texts {
    static let about = String(localized: "about", defaultValue: "About")
    static let aboutText = String(localized: "aboutText", defaultValue: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut.")
    static let achievementText = String(localized: "achievementText", defaultValue: "Complete your first year without smoking")
    static let achievements = String(localized: "achievements", defaultValue: "Achievements")
    static let back = String(localized: "back", defaultValue: "Previous")
    static let bloodOxygen = String(localized: "bloodOxygen", defaultValue: "Blood Oxygen")
    static let confirm = String(localized: "confirm", defaultValue: "Confirm")
    static let continueText = String(localized: "continueText", defaultValue: "Continue")
    static let done = String(localized: "done", defaultValue: "Done")
    static let myAchievements = String(localized: "myAchievements", defaultValue: "Your Achievements")
    static let next = String(localized: "next", defaultValue: "Next")
    static let nextAchievement = String(localized: "nextAchievement", defaultValue: "Next Achievement")
    static let nextAchievements = String(localized: "nextAchievements", defaultValue: "Next Achievements")
    static let prevAchievement = String(localized: "prevAchievement", defaultValue: "Previous Achievement")
    static let progress = String(localized: "progress", defaultValue: "Progress")
    static let source = String(localized: "source", defaultValue: "Source")
    static let sourceText = String(localized: "sourceText", defaultValue: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    static let streak = String(localized: "streak", defaultValue: "Streak")
    static let title = String(localized: "title", defaultValue: "Title")
    static let today = String(localized: "today", defaultValue: "A new beginning!")
    
    // MARK: LocalNotifications
    static let notificationYes = String(localized: "notificationYes", defaultValue: "Yes")
    static let notificationNo = String(localized: "notificationNo", defaultValue: "No, I smoked today")
    static let contentTitle = String(localized: "contentTitle", defaultValue: "Hey there, just checking in!")
    static let contentSubtitle = String(localized: "contentSubtitle", defaultValue: "")
    static let contentBody = String(localized: "contentBody", defaultValue: "Are you keeping up your streak of not smoking?")
    
    // MARK: SavingsComponent
    static let savings = String(localized: "savings", defaultValue: "Savings")
    static let savedSoFar = String(localized: "savedSoFar", defaultValue: "Saved so far!")
    
    // MARK: PresentationView
    static let onboardingInformations = String(localized: "onboardingInformations", defaultValue: "Keep yourself motivated during your journey to quit smoking.")
    static let onboardingInformations2 = String(localized: "onboardingInformations2", defaultValue: "With NicQuit, be sure that you will feel well accompanied and supported throughout this journey!")
    static let presentation = String(localized: "presentation", defaultValue: "Welcome!")
    
    // MARK: SmokingTypeView
    static let cigarette = String(localized: "cigarette", defaultValue: "Common cigarette")
    static let eCigarette = String(localized: "eCigarette", defaultValue: "Electronic cigarette")
    static let smokingType = String(localized: "smokingType", defaultValue: "What do you currently smoke?")
    
    // MARK: CigaretteCountView
    static let cigaretteCountQuestion = String(localized: "cigaretteCountQuestion", defaultValue: "How many cigarettes do you smoke per day?")
    static func returnCigarettes(number: Int) -> String {
        return number == 1 ? String(localized: "returnCigarette", defaultValue: "\(number) cigarette per day") : String(localized: "returnCigarettes", defaultValue: "\(number) cigarettes per day")
    }
    
    // MARK: VapeFrequencyView
    static let vapeFrequencyQuestion = String(localized: "vapeFrequencyQuestion", defaultValue: "How many times do you smoke per day?")
    static func returnVapeFrequency(number: Int) -> String {
        return number == 1 ? String(localized: "returnVapeFrequency", defaultValue: "once per day") : String(localized: "returnVapeFrequencies", defaultValue: "\(number) times per day")
    }
    
    // MARK: CigarettesPerPackView
    static let cigarettesPerPack = String(localized: "cigarettesPerPack", defaultValue: "How many cigarettes are there in the pack you buy?")
    static func returnCigarettesPerPack(number: Int) -> String {
        return number == 1 ? String(localized: "returnCigarettePerPack", defaultValue: "\(number) cigarette per pack") : String(localized: "returnCigarettesPerPack", defaultValue: "\(number) cigarettes per pack")
    }
    
    // MARK: PackCostView
    static let packCostQuestion = String(localized: "packCostQuestion", defaultValue: "How much does a pack cost on average?")
    static let averagePack = String(localized: "averagePack", defaultValue: " average per pack")
    static func returnPackCost(number: Int) -> String {
        return String(localized: "returnPackCost", defaultValue: "\(Locale.current.currencySymbol ?? "R$")\(number) pack cost average")
    }
    
    // MARK: VapeCostView
    static let add10 = String(localized: "add10", defaultValue: "Add $10")
    static let add100 = String(localized: "add100", defaultValue: "Add $100")
    static let vapeCostQuestion = String(localized: "vapeCostQuestion", defaultValue: "How much do you spend on e-cigs per month?")
    static let averageVape = String(localized: "averageVape", defaultValue: " on average per month")
    static func returnVapeCost(number: Int) -> String {
        return String(localized: "returnVapeCost", defaultValue: "\(Locale.current.currencySymbol ?? "R$")\(number) vaping cost average")
    }
    
    // MARK: SmokingHoursView
    static let smokingHoursQuestion = String(localized: "smokingHoursQuestion", defaultValue: "What times do you smoke?")
    
    // MARK: HealthHomeView
    static let healthHomeMessages = [
        String(localized: "healthHomeMessage1", defaultValue: "Take a moment to reflect on how far you've come. Celebrate your progress!"),
        String(localized: "healthHomeMessage2", defaultValue: "Take a moment to remember your reasons to quit and reflect on what they mean to you."),
        String(localized: "healthHomeMessage3", defaultValue: "Share your progress with a supportive friend today for an extra dose of motivation!")
    ]
    static let dailyMotivation = String(localized: "dailyMotivation", defaultValue: "Daily Motivation")
    static let healthHomeText = String(localized: "healthHomeText", defaultValue: "")
    static func returnHealthMessage(number: Double) -> String{
        return String(localized: "returnHealthMessage", defaultValue: "You have saved around $\(Int(number)) so far. Keep it up!")
    }
    
    // MARK: StreakHomeView
    static let year = String(localized: "year", defaultValue: "year")
    static let years = String(localized: "years", defaultValue: "years")
    static let month = String(localized: "month", defaultValue: "month")
    static let months = String(localized: "months", defaultValue: "months")
    static let day = String(localized: "day", defaultValue: "day")
    static let days = String(localized: "days", defaultValue: "days")
    static let yourRecord = String(localized: "yourRecord", defaultValue: "Your record is")
    
    enum Keys : String {
        case smokedID = "SmokedID"
        case notSmokedID = "NotSmokedID"
        case categoryID
        case smokedButton = "Fumei"
        case notSmokedButton = "Não Fumei"
        case isOnboarding
        case motivationText
        case dailyMotivation
    }
}
