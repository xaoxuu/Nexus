//
//  File.swift
//  
//
//  Created by xaoxuu on 2022-1-8.
//

import Foundation

public extension Data {
    
    /// 枢纽类型
    var nexus: Nexus<Data> { .init(data: self) }
    
}

public extension Nexus where T == Data {
    
    internal var dataValue: Data { value as! Data }
    
    internal init(data: Data) {
        self.value = data
    }
    
    /// Data -> String
    var stringValue: String? { .init(data: dataValue, encoding: .utf8) }
    
}


// MARK: Json

public extension Nexus where T == Data {
    
    /// Data -> [Any]? or [AnyHashable: Any]?
    var jsonValue: Any? { dataValue.toJson(options:[]) }
    
    /// Data -> [Any] or [AnyHashable: Any]?
    /// - Parameter opt: ReadingOptions
    /// - Returns: [Any] or [AnyHashable: Any]?
    func jsonValue(options opt: JSONSerialization.ReadingOptions) -> Any? {
        dataValue.toJson(options: opt)
    }
    
    /// Data -> [Any]?
    var arrayValue: [Any]? { arrayValue(options:[]) }
    
    /// Data -> [Any]?
    /// - Parameter opt: ReadingOptions
    /// - Returns: [Any]?
    func arrayValue(options opt: JSONSerialization.ReadingOptions) -> [Any]? {
        jsonValue(options: opt) as? [Any]
    }
    
    /// Data -> [AnyHashable: Any]?
    var dictionaryValue: [AnyHashable: Any]? { dictionaryValue(options:[]) }
    
    /// Data -> [AnyHashable: Any]?
    /// - Parameter opt: ReadingOptions
    /// - Returns: [AnyHashable: Any]?
    func dictionaryValue(options opt: JSONSerialization.ReadingOptions) -> [AnyHashable: Any]? {
        jsonValue(options: opt) as? [AnyHashable: Any]
    }
    
}
