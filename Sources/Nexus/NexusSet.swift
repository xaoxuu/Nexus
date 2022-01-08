//
//  File.swift
//  
//
//  Created by xaoxuu on 2022-1-8.
//

import Foundation

public extension Set {
    
    /// 枢纽类型
    var nexus: Nexus<Set<AnyHashable>> { .init(json: self) }
    
}

public extension Nexus where T == Set<AnyHashable> {
    
    internal init(json: Set<AnyHashable>) {
        self.value = json
    }
    
    /// Set -> [AnyHashable]
    var arrayValue: [AnyHashable] { Array(value as! Set<AnyHashable>) }
    
}

// MARK: Data

public extension Nexus where T == Set<AnyHashable> {
    
    /// Set -> Data?
    var dataValue: Data? {
        dataValue(options: [])
    }
    
    /// Set -> Data?
    /// - Parameter opt: WritingOptions
    /// - Returns: Data?
    func dataValue(options opt: JSONSerialization.WritingOptions) -> Data? {
        arrayValue.toData(options: opt)
    }
    
    /// Set -> String?
    var stringValue: String? {
        stringValue(options: [])
    }
    
    /// Set -> String (prettyPrinted)
    var stringValueForPrint: String {
        stringValue(options: [.prettyPrinted]) ?? ""
    }
    
    /// Set -> String?
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

