//
//  File.swift
//  
//
//  Created by xaoxuu on 2022-1-8.
//

import Foundation

public extension Dictionary {
    
    /// 枢纽类型
    var nexus: Nexus<Dictionary<AnyHashable, Any>> { .init(json: self) }
    
}

public extension Nexus where T == Dictionary<AnyHashable, Any> {
    
    internal var jsonValue: [AnyHashable: Any] { value as! [AnyHashable: Any] }
    
    internal init(json: [AnyHashable: Any]) {
        self.value = json
    }
    
}

// MARK: Data

public extension Nexus where T == Dictionary<AnyHashable, Any> {
    
    /// [AnyHashable: Any] -> Data?
    var dataValue: Data? {
        dataValue(options: [])
    }
    
    /// [AnyHashable: Any] -> Data?
    /// - Parameter opt: WritingOptions
    /// - Returns: Data?
    func dataValue(options opt: JSONSerialization.WritingOptions) -> Data? {
        jsonValue.toData(options: opt)
    }
    
    /// [AnyHashable: Any] -> String?
    var stringValue: String? {
        stringValue(options: [])
    }
    
    /// [AnyHashable: Any] -> String (prettyPrinted)
    var stringValueForPrint: String {
        stringValue(options: [.prettyPrinted]) ?? ""
    }
    
    /// [AnyHashable: Any] -> String?
    /// - Parameter opt: WritingOptions
    /// - Returns: String?
    func stringValue(options opt: JSONSerialization.WritingOptions) -> String? {
        if let data = dataValue(options: opt) {
            return .init(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
    
}

// MARK: Exts

public extension Dictionary where Key == String {
    
    func string(forKey key: String) -> String? {
        if let obj = self[key] as? String {
            return obj
        } else if let obj = self[key] as? Int {
            return String(obj)
        } else if let obj = self[key] as? Double {
            return String(obj)
        } else if let obj = self[key] as? NSNumber {
            return obj.stringValue
        }
        return nil
    }
    
    func bool(forKey key: String) -> Bool? {
        if let b = self[key] as? Bool {
            return b
        }
        var str = ""
        if let obj = self[key] as? String {
            str = obj
        } else if let obj = self[key] as? Int {
            str = String(obj)
        }
        str = str.lowercased()
        if let b = Bool(str) {
            return b
        } else if ["true", "yes", "1"].contains(str) {
            return true
        } else if ["false", "no", "0"].contains(str) {
            return false
        }
        return nil
    }
    
    func bool(forKey key: String, defaultValue: Bool) -> Bool {
        bool(forKey: key) ?? defaultValue
    }
    
    func int(forKey key: String) -> Int? {
        if let obj = self[key] as? Int {
            return obj
        } else if let obj = self[key] as? String {
            return Int(obj)
        }
        return nil
    }
    
    func double(forKey key: String) -> Double? {
        if let obj = self[key] as? Double {
            return obj
        } else if let obj = self[key] as? String {
            return Double(obj)
        }
        return nil
    }
    
    func dictionary(forKey key: String) -> [AnyHashable: Any]? {
        if let obj = self[key] as? [AnyHashable: Any] {
            return obj
        } else if let obj = self[key] as? String {
            return obj.nexus.dictionaryValue
        } else if let obj = self[key] as? Data {
            return obj.nexus.dictionaryValue
        }
        return nil
    }
    
    func array(forKey key: String) -> [Any]? {
        if let obj = self[key] as? [Any] {
            return obj
        } else if let obj = self[key] as? String {
            return obj.nexus.arrayValue
        } else if let obj = self[key] as? Data {
            return obj.nexus.arrayValue
        }
        return nil
    }
    
    func stringArray(forKey key: String) -> [String]? {
        array(forKey: key) as? [String]
    }
    
}


public extension Dictionary {
    var stringKeyDictionary: [String: Any]? { self as? [String: Any] }
    
}
