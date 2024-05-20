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
