//
//  UserDataManager.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    let container = NSPersistentContainer(name: "UserData")
    
    var userEntity: User?
    var userModel : UserModel?
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Basics operations
    func fetchUser(){
        let request = NSFetchRequest<User>(entityName: "User")
        
        do{
            if let fetchedUser = try container.viewContext.fetch(request).first {
                userEntity = fetchedUser
                parseData()
            }
        } catch {
            fatalError("Problema na requisição de um usuario")
        }
    }
    
     func saveData(){
        do {
            try container.viewContext.save()
            fetchUser()
        } catch {
            fatalError("Erro na criação de um usuario")
        }
    }
    
    func createUser(userCreate: User) {
        self.userEntity = User(context: container.viewContext)
        guard let user = self.userEntity else { return }
        user.id = UUID()
        user.achievementsList = userCreate.achievementsList
        user.cigarettesInPack = userCreate.cigarettesInPack
        user.cigarsPerDay = userCreate.cigarsPerDay
        user.cigarsType = userCreate.cigarsType
        user.hourSmoke = userCreate.hourSmoke
        user.quitDay = userCreate.quitDay
        user.recordDate = userCreate.recordDate
        user.smokeCost = userCreate.smokeCost
        user.startStreak = userCreate.startStreak
        user.streakPast = userCreate.streakPast
        
        saveData()
    }
    
    func parseData() {
        guard let userModel = self.userModel, let userEntity = self.userEntity else { return }
        
        userModel.achievementsList = userEntity.achievementsList ?? [UUID()]
        userModel.cigarettesInPack = Int(userEntity.cigarettesInPack)
        userModel.cigarsPerDay = Int(userEntity.cigarsPerDay)
        userModel.cigarsType = userEntity.cigarsType ?? "cigarette"
        userModel.hourSmoke = userEntity.hourSmoke ?? [Date()]
        userModel.quitDay = userEntity.quitDay ?? Date()
        userModel.recordDate = userEntity.recordDate ?? DateInterval()
        userModel.smokeCost = userEntity.smokeCost
        userModel.startStreak = userEntity.startStreak ?? Date()
        userModel.streakPast = userEntity.streakPast ?? DateInterval()

    }
    
}
