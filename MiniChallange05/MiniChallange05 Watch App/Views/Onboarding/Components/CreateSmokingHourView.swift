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
    @State var data: Date = .now
    
    var body: some View {
        VStack(alignment: .leading){
            Button{
                pageManager.page = .smokingHours
            } label: {
                Text("Cancelar")
                    .bold()
            }.buttonStyle(PlainButtonStyle())
            Spacer()
            
            if Locale.current.language.region == "US" && Locale.current.language.languageCode == "en" {
                DatePicker("", selection: $data, displayedComponents: [.hourAndMinute])
            } else {
                DatePicker("", selection: $data, displayedComponents: [.hourAndMinute])
                    .overlay {
                        HStack {
                            Spacer()
                            Rectangle()
                                .frame(width: 7, height: 40)
                                .foregroundStyle(.black)
                        }
                    }
            }
            
            Button("Confirmar") {
                
                pageManager.page = .smokingHours
            }
            
        }
    }
}

#Preview {
    CreateSmokingHourView()
        .environment(PageManager())
}
