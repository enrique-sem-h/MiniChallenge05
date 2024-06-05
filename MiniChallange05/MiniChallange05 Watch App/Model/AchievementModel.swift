//
//  File.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation
import SwiftUI


class AchievementModel{
    var progress : Float = 0.0
    let title : String
    let description : String
    var wasConquered : Bool = false
    let daysToAchieve : Int
    var id : UUID
    let image : UIImage?
    
    init(title: String, description: String, daysToAchieve : AchievementCases, imageName : String) {
        self.title = title
        self.description = description
        self.id = UUID()
        self.daysToAchieve = daysToAchieve.rawValue
        
        self.image = UIImage(named: imageName) ?? nil
        
        //Atribui o valor real que se estiver no coreData
        self.wasConquered = self.checkWhetherWasReached(uuid: self.id)
        
        self.progress = evaluateProgress()
        
        self.releaseArchievment()
    }
}

extension AchievementModel{
    
    func releaseArchievment(){
        
        let daysElapsed = getStreakDays()
        
        switch daysElapsed{
    
        case AchievementCases.firstDay.rawValue:
            //Adicionar o UUID da streak de um dia no array do coreData
            self.wasConquered = true
            break
        case AchievementCases.firstWeek.rawValue:
            //Adicionar o UUID da streak de uma semana no array do coreData
            self.wasConquered = true
            break
        case AchievementCases.halfMonth.rawValue:
            //Adicionar o UUID da streak de 15 dias no array do coreData
            self.wasConquered = true
            break
        case AchievementCases.month.rawValue: 
            //Adicionar o UUID da streak de um mês no array do coreData
            self.wasConquered = true
            break
        case AchievementCases.threeMonths.rawValue:
            //Adicionar o UUID da streak de três meses no array do coreData
            self.wasConquered = true
            break
        case AchievementCases.halfYear.rawValue:
            //Adicionar o UUID da streak de 6 meses no array do coreData
            self.wasConquered = true
            break
        case AchievementCases.year.rawValue:
            //Adicionar o UUID da streak de um ano no array do coreData
            self.wasConquered = true
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
    
    func checkWhetherWasReached(uuid : UUID) -> Bool{
        guard let coreDataAchievements = DataManager.shared.userModel?.achievementsList else {return false}
        
        for id in coreDataAchievements{
            if uuid == id{
                return true
            }
        }
        return false
    }
    
    func evaluateProgress() -> Float{
        guard let streakDays = getStreakDays() else {return 0.0}
        self.progress = Float(streakDays / daysToAchieve)
        return self.progress
    }
}
