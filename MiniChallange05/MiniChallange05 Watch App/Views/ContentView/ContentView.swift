//
//  ContentView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var estados = AllViews.onboarding1
    
    var body: some View {
        
        switch estados {
        case .onboarding1:
            Onboarding1View(estados: $estados)
                
        case .onboarding2:
            Onboarding2View(estados: $estados)
                
        }
    }
    
}

#Preview {
    ContentView()
}

enum AllViews {
    case onboarding1, onboarding2
}

