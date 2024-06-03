//
//  HealthHomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct Updater: Codable { // a simple struct to validate if the health message has been updated today
    var date: Date = .now
    var canUpdate: Bool = true
}

struct HealthHomeView: View {
    @State var messages = [
    "Take a moment to reflect on how far you've come. Celebrate your progress!",
    "Take a moment to remember your reasons to quit and reflect on what they mean to you.",
//        "You have attained 10 achievements so far. Good job!",
    "Share your progress with a supportive friend today for an extra dose of motivation!",
    ]
    @State var text = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.gray.opacity(0.6))
                .frame(width: 162, height: 120)
                .overlay(alignment: .bottomLeading) {
                    Text(text)
                        .font(.body)
                        .font(.system(size: 14, weight: .none))
                        .minimumScaleFactor(0.5)
                        .padding()
                }
        }.onAppear{
            if let userDefaultsText = UserDefaults.standard.string(forKey: "motivationText") {
                text = userDefaultsText
            }
            if retrieveSavings() > 50 {
                messages.append("You have saved around $\(Int(retrieveSavings())) so far. Keep it up!")
            }
            checkUpdate()
        }
    }
    
    // checks if the message has been updated today
    func checkUpdate(){
        let calendar = Calendar.current
        
        guard var updater = getUpdater() else { return }
        if !calendar.isDateInToday(updater.date) {
            updater.date = .now
            updater.canUpdate = true
            setUpdater(newValue: updater)
            updateMessage()
        } else if updater.canUpdate {
            updateMessage()
        }
    }
    
    // updates the message for the day
     func updateMessage() {
         guard var updater = getUpdater() else { return }
         if updater.canUpdate {
            text = messages[Int.random(in: 0..<messages.count)]
            UserDefaults.standard.setValue(text, forKey: "motivationText")
            updater.date = .now
            updater.canUpdate = false
            setUpdater(newValue: updater)
        }
    }
    
    // retrieving updater from UserDefaults
    private func getUpdater() -> Updater? {
        if UserDefaults.standard.value(forKey: "dailyMotivation") != nil {
            if let data = UserDefaults.standard.object(forKey: "dailyMotivation") as? Data {
                return try? JSONDecoder().decode(Updater.self, from: data)
            }
            return nil
        } else {
            let updater = Updater()
            setUpdater(newValue: updater)
            return updater
        }
    }
    
    // storing updater in UserDefaults
    private func setUpdater(newValue: Updater) {
        if let encodedData = try? JSONEncoder().encode(newValue) {
            UserDefaults.standard.setValue(encodedData, forKey: "dailyMotivation")
        }
    }
    
    // retrieves user's savings for message
    func retrieveSavings() -> Double {
        guard let userModel = DataManager.shared.userModel else { return 0 }
        var savings: Double = 0
        let dailyCost = userModel.smokeCost / 30
        let currentStreak: TimeInterval = Date().timeIntervalSince(userModel.startStreak)
        
        savings = (currentStreak / 86400) * dailyCost
        
        return savings
    }
}
