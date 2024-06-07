//
//  DateIntervalTransformer.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 21/05/24.
//

import Foundation

// Esta classe define um transformador de valor personalizado para converter entre DateInterval e Data.
// É utilizado para armazenar e recuperar objetos DateInterval em formatos que o Core Data pode gerenciar.
@objc(DateIntervalTransformer)
class DateIntervalTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let dateInterval = value as? DateInterval else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: dateInterval, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let dateInterval = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSDateInterval.self, from: data)
            return dateInterval
        } catch {
            return nil
        }
    
    }
    
}
