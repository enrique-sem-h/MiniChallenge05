//
//  PresentationView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct PresentationView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("Presentation")
                .padding()
            
            Button("SmokingYpe") {
                pageManager.page = .smokingType
            }
            .padding()
        }
    }
}

#Preview {
    PresentationView()
        .environment(PageManager())
}
