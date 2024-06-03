//
//  OnboardingPicker.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 20/05/24.
//

import SwiftUI

//Colocar entre 1 e 20
struct OnboardingPicker: View {
    @Binding var selectedNumber: Int
    @State var label: String?
    @State var range: Range<Int>?
    
    var body: some View {
        
        Picker(label ?? "", selection: $selectedNumber) {
            ForEach(range ?? 1..<21) { number in
                Text("\(number)").tag(number)
            }
        }
        .pickerStyle(WheelPickerStyle())
        
    }
}

#Preview {
    OnboardingPicker(selectedNumber: .constant(1))
}
