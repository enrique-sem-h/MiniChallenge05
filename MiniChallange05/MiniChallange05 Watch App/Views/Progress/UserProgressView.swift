//
//  HealthProgressView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct UserProgressView: View {
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundStyle( .background)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        Text(Texts.progress)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    SavingsComponent()
                }
                .padding()
            }
        }
    }
    
}

#Preview {
    UserProgressView()
}
