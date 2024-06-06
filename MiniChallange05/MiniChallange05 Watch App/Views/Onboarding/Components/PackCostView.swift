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
    let textConfig :TextConfig
    
    
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            VStack {
                Text(Texts.packCostQuestion)
                    .font(.title2)
                    .minimumScaleFactor(textConfig.scaleFactor)
                    .frame(maxWidth: .infinity, maxHeight: textConfig.maxHeight, alignment: .leading)
                
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
                        .frame(width: textConfig.frameHeight + 5, height: textConfig.frameHeight)
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
                
                HStack {
                    Text("\(Locale.current.currencySymbol ?? "R$")\(tempVar)")
                        .foregroundStyle(.brandYellow)
                Text(Texts.averagePack)
                }.italic()
                
                Button {
                    if tempVar > 0 {
                        tempVar -= 1
                    }
                } label: {
                    Text(Texts.add10)
                }
                .clipShape(Circle())
                
                OnboardingPicker(selectedNumber: $tempVar, range: 0..<201)
                    .frame(width: textConfig.frameHeight + 5, height: textConfig.frameHeight)
                    .padding(.bottom,10)
                
                Button {
                    if tempVar < 200 {
                        tempVar += 1
                    }
                    
                } label: {
                    Text(Texts.add100)
                }
                .clipShape(Circle())
                
            }
            
            Text("\(Locale.current.currencySymbol ?? "R$")\(tempVar)")
                .foregroundColor(Color(red: 222 / 255, green: 255 / 255, blue: 19 / 255))
            + Text(Texts.averagePack)
            
            Button {
                if tempVar >= 190 {
                    tempVar = 200
                } else {
                    tempVar += 10
                }
            } label: {
                Text("Add $10")
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255, opacity: 0.5 / 1))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
            Button {
                if tempVar >= 100 {
                    tempVar = 200
                } else {
                    tempVar += 100
                }
            } label: {
                Text("Add $100")
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255, opacity: 0.5 / 1))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .padding(.bottom, 14)
            
            GenericBackAndNextButton(fowardView: .smokingHours, backwardsView: .cigarettesPerPack, tempVar: $tempVar, defVar: $defVar)
                .padding(.top)
            
        }
        .padding(.horizontal)
        .background(
            LinearGradient(colors: [.achievementPurple,
                                    .black.opacity(0.2),
                                    .black], startPoint: .top, endPoint: .bottom)
        )
        .onDisappear{
            userPreferences.smokeCost = Double(defVar)
        }
    }
}

#Preview {
    PackCostView(tempVar: 2, defVar: .constant(200), viewAtual: .constant(.cigarettesPerPack), textConfig: TextConfig(), userPreferences: UserPreferences())
        .environment(PageManager())
}
