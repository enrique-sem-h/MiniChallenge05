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
    @State var text = "this shouldnt appear"
    
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
            updateMessage()
        }
    }
    
    // checks if the message has been updated today
    mutating func checkUpdate(){
        let calendar = Calendar.current
        
        guard var updater = getUpdater() else { return }
        if !calendar.isDateInToday(updater.date) {
            updater.date = .now
            updater.canUpdate = true
            updateMessage()
        } else if updater.canUpdate {
            updateMessage()
        }
    }
    
    // updates the message for the day
     func updateMessage() {
        let messages = [
        "You have saved around $100 so far. Keep it up!",
        "Take a moment to reflect on how far you've come. Celebrate your progress!",
        "Take a moment to remember your reasons to quit and reflect on what they mean to you.",
//        "You have attained 10 achievements so far. Good job!",
        "Share your progress with a supportive friend today for an extra dose of motivation!",
        ]
         
         guard var updater = getUpdater() else { return }
//         if updater.canUpdate {
            text = messages[Int.random(in: 0..<messages.count)]
            updater.date = .now
            updater.canUpdate = false
            setUpdater(newValue: updater)
//        }
    }
    
    // retrieving updater from UserDefaults
    private func getUpdater() -> Updater? {
        if let data = UserDefaults.standard.object(forKey: "dailyMotivation") as? Data {
            return (try? JSONDecoder().decode(Updater.self, from: data))
        }
        return nil
    }
    
    // storing updater in UserDefaults
    private func setUpdater(newValue: Updater) {
        if let encodedData = try? JSONEncoder().encode(newValue) {
            UserDefaults.standard.setValue(encodedData, forKey: "dailyMotivation")
        }
    }
}
