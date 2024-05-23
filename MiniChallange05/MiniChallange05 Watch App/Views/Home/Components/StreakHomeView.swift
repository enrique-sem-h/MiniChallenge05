//
//  StreakComponents.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct StreakComponents: View {
    var body: some View {
        VStack {
            HStack {
                Text("Streak")
                Spacer()
            } .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            HStack {
                Text("11 Meses \n11 Dias")//Placeholder, criar o componente para isso
                Spacer()
            }
            .padding(.bottom)
            
            HStack {
                Text("Seu recorde é de 10 meses e 11 dias")
                Spacer()
            }
            .padding(.bottom)
        }
        .background(.blue.opacity(0.8))
    }
}

#Preview {
    StreakComponents()
}
