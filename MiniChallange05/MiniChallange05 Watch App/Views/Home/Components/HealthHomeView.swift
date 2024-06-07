//
//  HealthHomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

// Esta estrutura define a visualização da tela de saúde, que exibe uma mensagem motivacional diária e informações de economia relacionadas ao abandono de hábitos prejudiciais à saúde.
struct Updater: Codable { // a simple struct to validate if the health message has been updated today
    var date: Date = .now
    var canUpdate: Bool = true
}

struct HealthHomeView: View {
    @State var messages = Texts.healthHomeMessages
    @State var text = Texts.healthHomeText
    
    var body: some View {
        VStack {
            
            HStack {
                Text(Texts.dailyMotivation)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.brandYellow)
                    .padding(.vertical)
                Spacer()
            }
            
            Text(text)
                .font(.body)
                .minimumScaleFactor(0.5)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Image("motivation")
                    .resizable()
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
        
        }.onAppear{
            if let userDefaultsText = UserDefaults.standard.string(forKey: Texts.Keys.motivationText.rawValue) {
                text = userDefaultsText
            }
            if retrieveSavings() > 50 {
                messages.append(Texts.returnHealthMessage(number: retrieveSavings()))
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
            UserDefaults.standard.setValue(text, forKey: Texts.Keys.motivationText.rawValue)
            updater.date = .now
            updater.canUpdate = false
            setUpdater(newValue: updater)
        }
    }
    
    // retrieving updater from UserDefaults
    private func getUpdater() -> Updater? {
        if UserDefaults.standard.value(forKey: Texts.Keys.dailyMotivation.rawValue) != nil {
            if let data = UserDefaults.standard.object(forKey: Texts.Keys.dailyMotivation.rawValue) as? Data {
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
            UserDefaults.standard.setValue(encodedData, forKey: Texts.Keys.dailyMotivation.rawValue)
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


#Preview {
    HealthHomeView(messages: Texts.healthHomeMessages, text: Texts.healthHomeText)
}
