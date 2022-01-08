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
    
    var arrayValue: [AnyHashable] { Array(value as! Set<AnyHashable>) }
    
}

// MARK: Data

public extension Nexus where T == Set<AnyHashable> {
    
    var dataValue: Data? {
        dataValue(options: [])
    }
    
    func dataValue(options opt: JSONSerialization.WritingOptions) -> Data? {
        arrayValue.toData(options: opt)
    }
    
    var stringValue: String? {
        stringValue(options: [])
    }
    
    var stringValueForPrint: String {
        stringValue(options: [.prettyPrinted]) ?? ""
    }
    
    func stringValue(options opt: JSONSerialization.WritingOptions) -> String? {
        if let data = dataValue(options: opt) {
            return .init(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
    
}

