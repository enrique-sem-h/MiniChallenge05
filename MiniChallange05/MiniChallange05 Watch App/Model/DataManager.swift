//
//  UserDataManager.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation
import CoreData

/// The `DataManager` class is a singleton that handles Core Data operations for managing user data.
///
/// ## Overview
/// The `DataManager` class is responsible for loading the persistent container, fetching, creating, and saving user data.
/// It also provides methods to update specific attributes of the user and handle achievements.
///
/// ## How to use?
/// You can access the shared instance of `DataManager` and use its methods to manipulate user data.
///
/// ```swift
/// let dataManager = DataManager.shared
/// dataManager.createUser()
/// dataManager.fetchUser()
/// dataManager.saveData()
/// dataManager.updatePackCost(smokeCost: 5.0)
/// ```
///
/// ## Example
/// ```swift
/// // Creating a new user
/// DataManager.shared.createUser()
///
/// // Fetching the user
/// DataManager.shared.fetchUser()
///
/// // Updating the cost of a pack of cigarettes
/// DataManager.shared.updatePackCost(smokeCost: 7.5)
/// ```
///
class DataManager {
    
    static let shared = DataManager()
    
    let container = NSPersistentContainer(name: "UserData")
    
    var userEntity: User?
    var userModel: UserModel?

//    var containerURL: URL {
//        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.MiniChallenge05.Group10.watchkit")!
//    }
 
    init() {
        ValueTransformer.setValueTransformer(UUIDArrayTransformer(), forName: NSValueTransformerName("UUIDArrayTransformer"))
        ValueTransformer.setValueTransformer(DateArrayTransformer(), forName: NSValueTransformerName("DateArrayTransformer"))
        ValueTransformer.setValueTransformer(DateIntervalTransformer(), forName: NSValueTransformerName("DateIntervalTransformer"))
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            } 
//            else {
//                let storeURL = self.containerURL.appendingPathComponent("MiniChallenge05.sqlite")
//                self.container.persistentStoreDescriptions.first!.url = storeURL
//            }
        }
        self.fetchUser()
    }
    
    // MARK: - Basic Operations
    
    /// Fetches the user data from the Core Data store.
    func fetchUser() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            if let fetchedUser = try container.viewContext.fetch(request).first {
                userEntity = fetchedUser
                parseData()
            }
        } catch {
            fatalError("Error fetching user data")
        }
    }
    
    /// Saves the current context of the Core Data store.
    func saveData() {
        do {
            try container.viewContext.save()
            fetchUser()
        } catch {
            fatalError("Error saving user data")
        }
    }
    
    /// Creates a new user entity and saves it to the Core Data store.
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
    
    /// Parses the fetched user data into the user model.
    func parseData() {
        guard let userEntity = self.userEntity else { return }
        
        if userModel == nil {
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
    
    /// Updates the cost of a pack of cigarettes.
    ///
    /// - Parameter smokeCost: The cost of a pack of cigarettes.
    func updatePackCost(smokeCost: Double) {
        self.userEntity?.smokeCost = smokeCost
        self.userModel?.smokeCost = smokeCost
        saveData()
    }
    
    /// Updates the number of cigarettes smoked per day.
    ///
    /// - Parameter count: The number of cigarettes smoked per day.
    func updateCigarreteCount(count: Int) {
        self.userEntity?.cigarsPerDay = Int16(count)
        self.userModel?.cigarsPerDay = Int16(count)
        saveData()
    }
    
    /// Updates the hours when the user smokes.
    ///
    /// - Parameter hourSmoke: An array of dates representing the hours when the user smokes.
    func updateHourSmoke(hourSmoke: [Date]) {
        self.userEntity?.hourSmoke = hourSmoke
        self.userModel?.hourSmoke = hourSmoke
        saveData()
    }
    
    /// Edits the user data.
    ///
    /// - Parameter cigarsPerDay: The number of cigars smoked per day (default is 0).
    func editData(cigarsPerDay: Int16 = 0) {
        guard let userEntity = self.userEntity else { return }
        userEntity.cigarsPerDay = cigarsPerDay
    }
    
    /// Resets the streak and updates the streak past interval.
    func resetStreak() {
        guard let userModel = self.userModel, let userEntity = self.userEntity, let userStartStreak = userEntity.startStreak else { return }
        
        resetRecord()
        userEntity.streakPast = DateInterval(start: userStartStreak, end: .now)
        userModel.streakPast = DateInterval(start: userStartStreak, end: .now)
        userEntity.startStreak = Date.now
        userModel.startStreak = Date.now
        saveData()
    }
    
    /// Resets the record if the current streak duration is longer than the previous record.
    func resetRecord() {
        guard let startStreak = self.userModel?.startStreak else { return }
        guard let recordDate = self.userModel?.recordDate else { return }
        
        let interval = DateInterval(start: startStreak, end: .now)
        
        if interval.duration > recordDate.duration {
            self.userEntity?.recordDate = interval
            self.userModel?.recordDate = interval
        }
        
        saveData()
    }
    
    /// Adds a new achievement to the user's achievement list.
    ///
    /// - Parameter uuid: The UUID of the achievement to be added.
    func freeAchievement(uuid: UUID) {
        userEntity?.achievementsList?.append(uuid)
    }
    
}
