//
//  Nexus.swift
//
//
//  Created by xaoxuu on 2022-1-8.
//

import Foundation

/// 枢纽类型
public struct Nexus<T> {
    internal let value: Any
}

// MARK: - internal func

fileprivate func DataToJson(from data: Data, options opt: JSONSerialization.ReadingOptions) -> Any? {
    do {
        let obj = try JSONSerialization.jsonObject(with: data, options: opt)
        return obj
    } catch {
        return nil
    }
}

fileprivate func JsonToData(from json: Any, options opt: JSONSerialization.WritingOptions) -> Data? {
    guard JSONSerialization.isValidJSONObject(json) else { return nil }
    do {
        return try JSONSerialization.data(withJSONObject: json, options: opt)
    } catch {
        return nil
    }
}

internal extension Data {
    func toJson(options opt: JSONSerialization.ReadingOptions) -> Any? {
        DataToJson(from: self, options: opt)
    }
}

internal extension Array {
    func toData(options opt: JSONSerialization.WritingOptions) -> Data? {
        JsonToData(from: self, options: opt)
    }
}

internal extension Dictionary {
    func toData(options opt: JSONSerialization.WritingOptions) -> Data? {
        JsonToData(from: self, options: opt)
    }
}
