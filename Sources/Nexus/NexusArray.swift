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
    
    /// [Any] -> Data?
    var dataValue: Data? {
        dataValue(options: [])
    }
    
    /// [Any] -> Data?
    /// - Parameter opt: WritingOptions
    /// - Returns: Data?
    func dataValue(options opt: JSONSerialization.WritingOptions) -> Data? {
        jsonValue.toData(options: opt)
    }
    
    /// [Any] -> String?
    var stringValue: String? {
        stringValue(options: [])
    }
    
    /// [Any] -> String (prettyPrinted)
    var stringValueForPrint: String {
        stringValue(options: [.prettyPrinted]) ?? ""
    }
    
    /// [Any] -> String?
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


public extension Array {
    var stringArray: [String]? { self as? [String] }
    var intArray: [Int]? { self as? [Int] }
}
