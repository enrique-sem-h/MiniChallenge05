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
    
    var body: some View {
        VStack {
            Picker("Number", selection: $selectedNumber) {
                ForEach(1..<21) { number in
                    Text("\(number)").tag(number)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
        }
    }
}

#Preview {
    OnboardingPicker(selectedNumber: .constant(1))
}
