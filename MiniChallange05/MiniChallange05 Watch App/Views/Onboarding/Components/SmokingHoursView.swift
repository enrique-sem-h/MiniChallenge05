//
//  SmokingHoursView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct SmokingHoursView: View {
    @Environment(PageManager.self) var pageManager
    @Binding var viewAnterior:Page
    
    var body: some View {
        VStack {
            Text("SmokingHours")
                .padding()
            
            
            HStack {
                Button("voltar") {
                    pageManager.page = viewAnterior
                }
                .padding()
                Button("finalizar") {
                    pageManager.page = .createSmokingHour
                }
                .padding()
            }
        }
    }
}

#Preview {
    SmokingHoursView(viewAnterior: .constant(.packCost))
        .environment(PageManager())
}
