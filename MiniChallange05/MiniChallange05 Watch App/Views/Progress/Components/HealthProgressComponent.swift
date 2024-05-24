//
//  HealthProgressComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct HealthProgressComponent: View {
    
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    
    @State private var porcentagem = 0.5
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(.gray.opacity(0.7))
            .frame(width: screenWidth, height: screenHeight * 0.4)
            .overlay {
                VStack {
                    HStack {
                        Image(systemName: "heart.fill")
                        
                        Spacer()
                        
                        Text("\(porcentagem)%") // Mostrar a porcentagem
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        Text("Title")
                        Spacer()
                    }
                    .padding()
                    
                    ProgressView(value: porcentagem)
                        
                    
//                    GeometryReader { geometry in
//                        ZStack(alignment: .leading) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(height: screenHeight * 0.03)
//                                .clipShape(.rect(cornerRadii: .init(topLeading: 0, bottomLeading: 10, bottomTrailing: 10, topTrailing: 0)))
//                            
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: geometry.size.width * CGFloat(porcentagem) / 100, height: screenHeight * 0.03)
//                                .foregroundColor(.blue) // Barra azul que carrega de acordo com a porcentagem
//                                .clipShape(.rect(cornerRadii: .init(topLeading: 0, bottomLeading: 0, bottomTrailing: 0, topTrailing: 0)))
//                        }
//                    }

                }
            }
    }
}

#Preview {
    HealthProgressComponent()
}
