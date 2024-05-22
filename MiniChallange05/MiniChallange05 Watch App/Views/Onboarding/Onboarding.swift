//
//  Onboarding1View.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

//Aqui estará os states, Environments, e métodos de navegação

//Navegação de possíveis telas
enum Page {
    case presentation
    case smokingType
    case cigaretteCount
    case vapeFrequency
    case cigarettesPerPack
    case packCost
    case vapeCost
    case smokingHours
    case createSmokingHour
}



@Observable class PageManager {
    var page: Page = .presentation
}

struct Onboard: View {
    @Environment(PageManager.self) var pageManager
    @State var defnumero: Int = 1
    @State var viewAnterior:Page = .packCost
    var userPreferences = UserPreferences()
    
    var body: some View {
        switch pageManager.page {
        case .presentation:
            PresentationView()
        case .smokingType:
            SmokingTypeView(userPreferences: userPreferences)
        case .cigaretteCount:
            CigaretteCountView(defVar: $defnumero, userPreferences: userPreferences)
        case .vapeFrequency:
            VapeFrequencyView(defVar: $defnumero, userPreferences: userPreferences)
        case .cigarettesPerPack:
            CigarettesPerPackView(defVar: $defnumero, userPreferences: userPreferences)
        case .packCost:
            PackCostView(defVar: $defnumero, viewAtual: $viewAnterior, userPreferences: userPreferences)
        case .vapeCost:
            VapeCostView(defVar: $defnumero, viewAtual: $viewAnterior, userPreferences: userPreferences)
        case .smokingHours:
            SmokingHoursView(viewAnterior: $viewAnterior, userPreferences: userPreferences)
        case .createSmokingHour:
            HomeView()
        }
    }
}

#Preview {
    Onboard()
        .environment(PageManager())
}
