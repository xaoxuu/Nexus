//
//  File.swift
//  
//
//  Created by xaoxuu on 2022-1-8.
//

import Foundation

public extension String {
    
    /// 枢纽类型
    var nexus: Nexus<String> { .init(string: self) }
    
}

public extension Nexus where T == String {
    
    internal var stringValue: String { value as! String }
    
    internal init(string: String) {
        self.value = string
    }
    
    /// String -> Bool
    var boolValue: Bool? {
        let str = stringValue.lowercased()
        if let b = Bool(str) {
            return b
        } else if ["true", "yes", "1"].contains(str) {
            return true
        } else if ["false", "no", "0"].contains(str) {
            return false
        }
        return nil
    }
    
    /// String -> Int
    var intValue: Int? { Int(stringValue) }
    
    /// String -> Double
    var doubleValue: Double? { Double(stringValue) }
    
    /// String -> Data
    var dataValue: Data? { stringValue.data(using: .utf8) }
    
}

// MARK: Json

public extension Nexus where T == String {
    
    /// Data -> [Any] or [AnyHashable: Any]
    var jsonValue: Any? { dataValue?.toJson(options:[]) }
    
    /// Data -> [Any] or [AnyHashable: Any]
    /// - Parameter opt: ReadingOptions
    /// - Returns: [Any] or [AnyHashable: Any]
    func jsonValue(options opt: JSONSerialization.ReadingOptions) -> Any? {
        dataValue?.toJson(options: opt)
    }
    
    /// Data -> [Any]
    var arrayValue: [Any]? { arrayValue(options:[]) }
    
    /// Data -> [Any]
    /// - Parameter opt: ReadingOptions
    /// - Returns: [Any]
    func arrayValue(options opt: JSONSerialization.ReadingOptions) -> [Any]? {
        jsonValue(options: opt) as? [Any]
    }
    
    /// Data -> [AnyHashable: Any]
    var dictionaryValue: [AnyHashable: Any]? { dictionaryValue(options:[]) }
    
    /// Data -> [AnyHashable: Any]
    /// - Parameter opt: ReadingOptions
    /// - Returns: [AnyHashable: Any]
    func dictionaryValue(options opt: JSONSerialization.ReadingOptions) -> [AnyHashable: Any]? {
        jsonValue(options: opt) as? [AnyHashable: Any]
    }
    
    
}
