//
//  CreateSmokingHourView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct CreateSmokingHourView: View {
    @Environment(PageManager.self) var pageManager
    
    @State var selectedHour = 12
    @State var selectedMinute = 00
    
    var body: some View {
        VStack(alignment: .leading){
            Button{
                pageManager.page = .smokingHours
            } label: {
                Text("Cancelar")
                    .bold()
            }.buttonStyle(PlainButtonStyle())
            Spacer()
            
            HStack {
                OnboardingPicker(selectedNumber: $selectedHour, label: "Hora", range: 0..<25)
                Text(":")
                OnboardingPicker(selectedNumber: $selectedMinute, label: "Minutos", range: 0..<60)
            }.frame(height: 120)
            
            Button("Confirmar"){
                
            }
        }
    }
}

#Preview {
    CreateSmokingHourView()
        .environment(PageManager())
}
