//
//  File.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation


class AchievementModel{
    var progress : Float
    let title : String
    let description : String
    var wasConquered : Bool
    var id : UUID
    
    init(progress: Float, title: String, description: String) {
        self.progress = progress
        self.title = title
        self.description = description
        self.wasConquered = false
        self.id = UUID()
    }
}

extension AchievementModel{
    func releaseArchievment(){
        
        let daysElapsed = getStreakDays()
        
        switch daysElapsed{
        case AchievementCases.startJourney.rawValue:
            //Inicio da jornada
            break
        case AchievementCases.firstDay.rawValue:
            //Adicionar o UUID da streak de um dia no array do coreData
            break
        case AchievementCases.firstWeek.rawValue:
            //Adicionar o UUID da streak de uma semana no array do coreData
            break
        case AchievementCases.halfMonth.rawValue:
            //Adicionar o UUID da streak de 15 dias no array do coreData
            break
        case AchievementCases.month.rawValue: 
            //Adicionar o UUID da streak de um mês no array do coreData
            break
        case AchievementCases.threeMonths.rawValue:
            //Adicionar o UUID da streak de três meses no array do coreData
            break
        case AchievementCases.halfYear.rawValue:
            //Adicionar o UUID da streak de 6 meses no array do coreData
            break
        case AchievementCases.year.rawValue:
            //Adicionar o UUID da streak de um ano no array do coreData
            break
        default:
            print("Non case was executed")
            break
        }
        
    }
    
    //Get the current period in the streak to check wich achievement should be released
    func getStreakDays() -> Int?{
        guard let startStreak = DataManager.shared.userEntity?.startStreak else {return 0}
        let calendar = Calendar.current
        let daysElapsed =  calendar.dateComponents([.day], from: startStreak, to: .now).day
        return daysElapsed
    }
    
}
