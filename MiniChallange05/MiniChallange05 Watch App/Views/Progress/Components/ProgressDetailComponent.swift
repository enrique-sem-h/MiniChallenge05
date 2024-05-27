//
//  HealthDetailComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct ProgressDetailComponent: View {
    @State var percentage: Float = 0.8
    @State var healthType: String = "Oxigenação no sangue"
    @State var aboutText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut."
    
    @State var sourceText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                Spacer()
                let p = Int(percentage * 100)
                Text("\(Int(p))%")
            }
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(healthType)
                .font(.title2)
            
            HStack {
                Text("About")
                    .font(.title3)
                Spacer()
            }
            .padding(.top)
            
            Text(aboutText)
            
            HStack {
                Text("Source")
                    .font(.title3)
                Spacer()
            }
            .padding(.top)
            
            Text(sourceText)
            
        }.scenePadding(.horizontal)
    }
}

#Preview {
    ProgressDetailComponent()
}
