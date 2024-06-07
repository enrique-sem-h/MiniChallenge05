//
//  SavingsComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 27/05/24.
//

import SwiftUI

/// Displays the savings component, showing the amount of money saved by not smoking.
struct SavingsComponent: View {
    /// The amount of money saved.
    @State var valueSaved: Double = 12
    
    var body: some View {
        VStack {
            HStack {
                Text(Texts.savings)
                    .padding(.top)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color(red: 222 / 255, green: 255 / 255, blue: 19 / 255))
                Spacer()
            }.padding(.bottom)
            
            HStack() {
                Image("SavingIcon")
                    .frame(maxWidth: screenWidth * 0.4, maxHeight: screenHeight * 0.4)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text("\(Locale.current.currencySymbol ?? "$") \(String(format: "%.f", valueSaved))")
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .font(.title)
                        .bold()
                    
                    Text(Texts.savedSoFar)
                        .font(.caption)
                }
                Spacer()
            }
        }
        .task {
            valueSaved = retrieveSavings()
        }
        
    }
    
    /// Retrieves the total savings based on the user's smoking data.
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
    SavingsComponent()
}

