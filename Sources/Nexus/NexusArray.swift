//
//  File.swift
//  
//
//  Created by xaoxuu on 2022-1-8.
//

import Foundation

public extension Array {
    
    /// 枢纽类型
    var nexus: Nexus<Array<Any>> { .init(json: self) }
    
}

public extension Nexus where T == Array<Any> {
    
    internal var jsonValue: [Any] { value as! [Any] }
    
    internal init(json: [Any]) {
        self.value = json
    }
    
}

// MARK: Data

public extension Nexus where T == Array<Any> {
    
    var dataValue: Data? {
        dataValue(options: [])
    }
    
    func dataValue(options opt: JSONSerialization.WritingOptions) -> Data? {
        jsonValue.toData(options: opt)
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

