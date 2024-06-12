//
//  DateArrayTransformer.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation

/// Value transformer to convert an array of Date objects to and from Data for storage.
@objc(DateArrayTransformer)
class DateArrayTransformer: ValueTransformer {
    
    /// Indicates that reverse transformation is allowed.
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    /// Specifies the transformed value class as NSData.
    override class func transformedValueClass() -> AnyClass {
        return NSData.self
    }
    
    /// Transforms an array of Date objects to Data.
    override func transformedValue(_ value: Any?) -> Any? {
        guard let dateArray = value as? [Date] else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: dateArray, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
    /// Reverses the transformation, converting Data back to an array of Date objects.
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let array = try NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: NSArray.self, from: data) as? [Date]
            return array
        } catch {
            return nil
        }
    
    }
    
}

