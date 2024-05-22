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
    
    init() {
        
        ValueTransformer.setValueTransformer(UUIDArrayTransformer(), forName: NSValueTransformerName("UUIDArrayTransformer"))
        ValueTransformer.setValueTransformer(DateArrayTransformer(), forName: NSValueTransformerName("DateArrayTransformer"))
        ValueTransformer.setValueTransformer(DateIntervalTransformer(), forName: NSValueTransformerName("DateIntervalTransformer"))
        
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
    
    func createUser(userCreate: UserModel) {
        let user = User(context: container.viewContext)
//        guard let user = self.userEntity else { return }
        user.achievementsList = userCreate.achievementsList
        user.cigarettesInPack = userCreate.cigarettesInPack ?? 0
        user.cigarsPerDay = userCreate.cigarsPerDay ?? 0
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
        userModel.cigarettesInPack = userEntity.cigarettesInPack
        userModel.cigarsPerDay = userEntity.cigarsPerDay
        userModel.cigarsType = userEntity.cigarsType ?? UserModel.SmokeType.cigarette.rawValue
        userModel.hourSmoke = userEntity.hourSmoke ?? [Date()]
        userModel.quitDay = userEntity.quitDay ?? Date()
        userModel.recordDate = userEntity.recordDate ?? DateInterval()
        userModel.smokeCost = userEntity.smokeCost
        userModel.startStreak = userEntity.startStreak ?? Date()
        userModel.streakPast = userEntity.streakPast ?? DateInterval()
    }
    
    
    func updatePackCost(smokeCost : Double){
        self.userEntity?.smokeCost = smokeCost
        self.userModel?.smokeCost = smokeCost
        saveData()
    }
    
    func updateCigarreteCount(count : Int){
        self.userEntity?.cigarsPerDay = Int16(count)
        self.userModel?.cigarsPerDay = Int16(count)
        saveData()
    }
    
}
