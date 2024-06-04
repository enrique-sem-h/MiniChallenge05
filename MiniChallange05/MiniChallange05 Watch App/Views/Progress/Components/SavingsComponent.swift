//
//  SavingsComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 27/05/24.
//

import SwiftUI

struct SavingsComponent: View {
    
    @State var valueSaved: Float = 12
    
    var body: some View {
        
        VStack {
            HStack {
                Text(Texts.savings)
                    .bold()
                Spacer()
            }.padding(.bottom)
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: screenWidth * 0.4, maxHeight: screenHeight * 0.4)
                
                VStack {
                    Text("\(Locale.current.currencySymbol ?? "$") \(String(format: "%.2f", valueSaved))")
                        .font(.title3)
                    
                    Text(Texts.savedSoFar)
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    SavingsComponent()
}
