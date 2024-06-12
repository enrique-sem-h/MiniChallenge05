//
//  UUIDArrayTransformer.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation

/// Value transformer to convert an array of UUIDs to and from Data for storage.
@objc(UUIDArrayTransformer)
class UUIDArrayTransformer: ValueTransformer {
    
    /// Transforms an array of UUIDs to Data.
    override func transformedValue(_ value: Any?) -> Any? {
        guard let uuid = value as? [UUID] else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: uuid, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
    /// Reverses the transformation, converting Data back to an array of UUIDs.
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

