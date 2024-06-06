//
//  StreakComponents.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct StreakComponents: View {
    
    @State var user = DataManager.shared.userModel
       
    var body: some View {
        VStack {
            
            HStack {
                Text(Texts.streak)
                    .font(.title2)
                Spacer()
            }
            .padding(.bottom, 10)
            .padding(.top)
            
            HStack {
                VStack(alignment: .leading) {
                    let duration = calculateDuration(from: user?.startStreak ?? .distantPast, to: Date())
                        if duration.years > 0 {
                            Text(formatYear(duration.years))
                                .font(.title2)
                                .bold()
                                .italic()
                            Text(formatMonth(duration.months))
                                .font(.title3)
                                .italic()
                            Text(formatDay(duration.days))
                                .font(.title3)
                                .italic()
                        } else if duration.months > 0 {
                            Text(formatMonth(duration.months))
                                .font(.title2)
                                .bold()
                                .italic()
                            Text(formatDay(duration.days))
                                .font(.title3)
                                .italic()
                        } else if duration.days > 0 {
                            Text(formatDay(duration.days))
                                .font(.title2)
                                .bold()
                                .italic()
                        } else {
                            Text(Texts.today)
                                .font(.title2)
                                .bold()
                                .italic()
                        }
    
                }.foregroundStyle(.brandYellow)
                
                Spacer()
            }
            .padding(.bottom)
            
            HStack {
                let duration = calculateDuration(from: user?.recordDate.start ?? .now, to: user?.recordDate.end ?? .now)
                VStack(alignment: .leading) {
                    if duration.years > 0 {
                        Text("\(Texts.yourRecord)")
                        Text("\(formatYear(duration.years)),  \(formatMonth(duration.months)) e \(formatDay(duration.days))")
                            .foregroundStyle(.brandYellow)
                            .font(.body)
                    } else if duration.months > 0 {
                        Text("\(Texts.yourRecord)")
                        Text("\(formatMonth(duration.months)) e \(formatDay(duration.days))")
                            .foregroundStyle(.brandYellow)
                            .font(.body)
                    } else if duration.days > 0 {
                        Text("\(Texts.yourRecord)")
                        Text("\(formatDay(duration.days))")
                            .foregroundStyle(.brandYellow)
                            .font(.body)
                    } else {
                        Text(Texts.today)
                            .minimumScaleFactor(1.0)
                    }
                }.font(.caption)
                    .truncationMode(.tail)
                    .lineLimit(2)
                    .minimumScaleFactor(0.6)
                
                Spacer()
            }
            .padding(.vertical)
            .onAppear {
                DataManager.shared.resetRecord()
            }
        }
        
    }
    
    func calculateDuration(from startDate: Date, to endDate: Date) -> (years: Int, months: Int, days: Int) {
        let calendar = Calendar.current
        
        // Calcula o número de meses
        let components = calendar.dateComponents([.year, .month, .day], from: startDate, to: endDate)
        let months = components.month ?? 0
        let days = components.day ?? 0
        let years = components.year ?? 0
        
        return (years, months, days)
        
    }
    
    func formatYear(_ years: Int) -> String {
        return years > 0 ? "\(years) \(years == 1 ? Texts.year : Texts.years)" : ""
    }
    
    func formatMonth(_ months: Int) -> String {
        return months > 0 ? "\(months) \(months == 1 ? Texts.month : Texts.months)" : ""
    }
    
    func formatDay(_ days: Int) -> String {
        return days > 0 ? "\(days) \(days == 1 ? Texts.day : Texts.days)" : ""
    }
    
}

#Preview {
    StreakComponents()
}
