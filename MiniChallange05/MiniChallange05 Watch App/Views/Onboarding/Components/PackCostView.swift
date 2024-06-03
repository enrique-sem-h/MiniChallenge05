//
//  PackCostView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct PackCostView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    @Binding var viewAtual: Page
    
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Quanto custa o maço de cigarro?")
                    .font(.title2)
                    .minimumScaleFactor(0.7)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                
                HStack {
                    Button {
                        if tempVar > 0 {
                            tempVar -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                    }
                    .clipShape(Circle())
                    
                    OnboardingPicker(selectedNumber: $tempVar, range: 0..<201)
                        .frame(width: 90, height: 85)
                        .padding(.bottom,10)
                    
                    Button {
                        if tempVar < 200 {
                            tempVar += 1
                        }
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                    }
                    .clipShape(Circle())
                    
                }
                
                Text("\(Locale.current.currencySymbol ?? "R$")\(tempVar) em média por maço")
                
                Button {
                    if tempVar >= 190 {
                        tempVar = 200
                    } else {
                        tempVar += 10
                    }
                } label: {
                    Text("Add $10")
                }
                
                Button {
                    if tempVar >= 100 {
                        tempVar = 200
                    } else {
                        tempVar += 100
                    }
                } label: {
                    Text("Add $100")
                }
                .padding(.bottom, 14)
                
                GenericBackAndNextButton(fowardView: .smokingHours, backwardsView: .cigarettesPerPack, tempVar: $tempVar, defVar: $defVar)
                    .padding(.top)
                
            }
            .padding(.horizontal)
        }.onDisappear{
            userPreferences.smokeCost = Double(defVar)
        }
    }
}

#Preview {
    PackCostView(tempVar: 2, defVar: .constant(200), viewAtual: .constant(.cigarettesPerPack), userPreferences: UserPreferences())
        .environment(PageManager())
}
