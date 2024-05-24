//
//  UUIDArrayTransformer.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation

@objc(UUIDArrayTransformer)
class UUIDArrayTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let uuid = value as? [UUID] else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: uuid, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let uuid = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: data)
            return uuid
        } catch {
            return nil
        }
    
    }
    
}
