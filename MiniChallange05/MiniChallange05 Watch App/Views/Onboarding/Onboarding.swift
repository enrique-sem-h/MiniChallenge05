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
    case homeView
}

@Observable class PageManager {
    var page: Page = .presentation
}

struct Onboard: View {
    @Environment(PageManager.self) var pageManager
    @State var defnumero: Int = 1
    @State var viewAnterior:Page = .packCost
    var userPreferences = UserPreferences()
    var isOnboarding: Bool
    let notification = LocalNotifications()
    let textConfig = TextConfig()
    
    // Serve to pass the date to all dates.
    @State var items: [Date] = [
        Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: Date())!
    ]
    
    @State var selectedItems: Set<Date> = []
    
    var body: some View {
        switch pageManager.page {
        case .presentation:
            PresentationView()
        case .smokingType:
            SmokingTypeView(userPreferences: userPreferences, textConfig: textConfig)
        case .cigaretteCount:
            CigaretteCountView(defVar: $defnumero, userPreferences: userPreferences, textConfig: textConfig)
        case .vapeFrequency:
            VapeFrequencyView(defVar: $defnumero, textConfig: textConfig, userPreferences: userPreferences)
        case .cigarettesPerPack:
            CigarettesPerPackView(defVar: $defnumero, textConfig: textConfig, userPreferences: userPreferences)
        case .packCost:
            PackCostView(defVar: $defnumero, viewAtual: $viewAnterior, textConfig: textConfig, userPreferences: userPreferences)
        case .vapeCost:
            VapeCostView(defVar: $defnumero, viewAtual: $viewAnterior, textConfig: textConfig, userPreferences: userPreferences)
        case .smokingHours:
            SmokingHoursView(viewAnterior: $viewAnterior, notification: notification, textConfig: textConfig, userPreferences: userPreferences,
                            items: $items, selectedItems: $selectedItems
            )
        case .createSmokingHour:
            CreateSmokingHourView(
                notification: notification, items: $items, selectedItems: $selectedItems
            )
            
        case .homeView:
            ContentView()
                .onAppear{
                    UserDefaults.standard.setValue(true, forKey: "isOnboarding")
            }
        }
    }
}

#Preview {
    Onboard(isOnboarding: true)
        .environment(PageManager())
}
