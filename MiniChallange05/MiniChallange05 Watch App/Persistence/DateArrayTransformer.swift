//
//  DateArrayTransformer.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation

@objc(DateArrayTransformer)
class DateArrayTransformer: ValueTransformer {
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override class func transformedValueClass() -> AnyClass {
        return NSData.self
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let dateArray = value as? [Date] else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: dateArray, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
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
