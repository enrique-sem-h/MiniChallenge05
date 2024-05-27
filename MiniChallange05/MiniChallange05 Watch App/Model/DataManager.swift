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
        self.fetchUser()
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
    
    func createUser() {
        self.userEntity = User(context: container.viewContext)
        guard let user = self.userEntity else { return }
        guard let userModel else { return }
        user.achievementsList = userModel.achievementsList
        user.cigarettesInPack = userModel.cigarettesInPack ?? 0
        user.cigarsPerDay = userModel.cigarsPerDay ?? 0
        user.cigarsType = userModel.cigarsType
        user.hourSmoke = userModel.hourSmoke
        user.quitDay = userModel.quitDay
        user.recordDate = userModel.recordDate
        user.smokeCost = userModel.smokeCost
        user.startStreak = userModel.startStreak
        user.streakPast = userModel.streakPast
        user.vapePerDay = userModel.vapePerDay ?? 0
        
        saveData()
    
    }
    
    func parseData() {
        guard let userEntity = self.userEntity else { return }
        
        if userModel == nil{
            userModel = UserModel(startStreak: userEntity.startStreak ?? Date(), streakPast: userEntity.streakPast ?? DateInterval(), recordDate: userEntity.recordDate ?? DateInterval(), cigarsType: UserModel.SmokeType(rawValue: userEntity.cigarsType ?? "cigarette") ?? .cigarette, cigarsPerDay: userEntity.cigarsPerDay, vapePerDay: userEntity.vapePerDay, cigarettesInPack: userEntity.cigarettesInPack, smokeCost: userEntity.smokeCost, hourSmoke: userEntity.hourSmoke ?? [], quitDay: userEntity.quitDay ?? Date(), achievementsList: userEntity.achievementsList ?? [])
        } else {
            userModel?.achievementsList = userEntity.achievementsList ?? [UUID()]
            userModel?.cigarettesInPack = userEntity.cigarettesInPack
            userModel?.cigarsPerDay = userEntity.cigarsPerDay
            userModel?.cigarsType = userEntity.cigarsType ?? "cigarette"
            userModel?.hourSmoke = userEntity.hourSmoke ?? [Date()]
            userModel?.quitDay = userEntity.quitDay ?? Date()
            userModel?.recordDate = userEntity.recordDate ?? DateInterval()
            userModel?.smokeCost = userEntity.smokeCost
            userModel?.startStreak = userEntity.startStreak ?? Date()
            userModel?.streakPast = userEntity.streakPast ?? DateInterval()
            userModel?.vapePerDay = userEntity.vapePerDay
        }
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
    
    func updateHourSmoke(hourSmoke: [Date]){
        self.userEntity?.hourSmoke = hourSmoke
        self.userModel?.hourSmoke = hourSmoke
        saveData()
    }
    
    func editData(cigarsPerDay: Int16 = 0) {
        guard let userEntity = self.userEntity else { return }
        userEntity.cigarsPerDay = cigarsPerDay
    }
    
}
