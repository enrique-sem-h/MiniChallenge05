//
//  SmokingHoursView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct SmokingHoursView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("SmokingHours")
                .padding()
            
            Button("CreateSmokingHour") {
                pageManager.page = .createSmokingHour
            }
            .padding()
        }
    }
}

#Preview {
    SmokingHoursView()
        .environment(PageManager())
}
