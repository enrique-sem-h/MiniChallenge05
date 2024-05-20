//
//  UserDataManager.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import Foundation
import CoreData

class UserDataManager: ObservableObject {
    
    static let shared = UserDataManager()
    
    let container = NSPersistentContainer(name: "UserData")
    
    var user: User?
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Basics operations
    func fetchUser() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do{
            if let fetchedUser = try container.viewContext.fetch(request).first {
                user = fetchedUser
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
    
    func createUser(tipoCigarro: String, cigarrosPorDia: Int16) {
        let user: User = User(context: container.viewContext)
        user.id = UUID()
        user.tipoCigarro = tipoCigarro
        user.cigarrosPorDia = cigarrosPorDia
        
        saveData()
    }
    
//    func createUser(tipoCigarro: String, cigarrosPorDia: Int16, macosNoCigarro: Int16, custoMaco: Double, quandoParou: Date, startStreak: Date) {
//        let user: User = User(context: context)
//        user.id = UUID()
//        user.tipoCigarro = tipoCigarro
//        user.cigarrosPorDia = cigarrosPorDia
//        user.macosNoCigarro = macosNoCigarro
//        user.custoMaco = custoMaco
//        user.quandoParou = quandoParou
//        user.startStreak = startStreak
//        
//        saveData()
//    }
    
    func editUser(tipoCigarro: String, cigarrosPorDia: Int16, macosNoCigarro: Int16, custoMaco: Double, quandoParou: Date, startStreak: Date, user: User) {
        user.id = UUID()
        user.tipoCigarro = tipoCigarro
        user.cigarrosPorDia = cigarrosPorDia
        user.macosNoCigarro = macosNoCigarro
        user.custoMaco = custoMaco
        user.quandoParou = quandoParou
        user.startStreak = startStreak
        
        saveData()
    }
    
//    func deleteUserInfo(user: User){
//        context.delete(user)
//        saveData()
//    }
    
}
