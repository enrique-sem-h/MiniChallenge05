//
//  Onboarding1View.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct Onboarding1View: View {

    @Binding var estados: AllViews
    
    @State var cigarrosPorDia: Int = 0
    @State var tipoCigarro = ""
    
    @State var possibilidadeDeCigarros: [Int16] = [0,1,2,3,4,5]
    
    var body: some View {
        VStack {
            Text("Quantos cigarros por dia você costuma fumar?")
            
            Picker("", selection: $cigarrosPorDia) {
                ForEach(0..<5) {
                    Text("\(possibilidadeDeCigarros[$0])")
                }
            }.padding(.horizontal)
            //.frame(width: 90, height: 100)
            
            Button(action: {
                UserDataManager.shared.createUser(tipoCigarro: "convencional", cigarrosPorDia: Int16(cigarrosPorDia))
                
                estados = .onboarding2
            }, label: {
                Text("Proxima")
            })
            
        }
    }
}

#Preview {
    Onboarding1View(estados: .constant(.onboarding1))
}
