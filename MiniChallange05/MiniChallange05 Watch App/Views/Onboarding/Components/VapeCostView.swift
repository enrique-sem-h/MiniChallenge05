//
//  VapeCostView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct VapeCostView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("VapeCost")
                .padding()
            
            Button("SmokingHours") {
                pageManager.page = .smokingHours
            }
            .padding()
        }
    }
}

#Preview {
    VapeCostView()
        .environment(PageManager())
}
