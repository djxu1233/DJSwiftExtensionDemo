//
//  Collections+DJSafe.swift
//  DJSwiftExtensionDemo
//
//  Created by minstone.DJ on 2020/3/19.
//  Copyright © 2020 minstone. All rights reserved.
//

import Foundation

extension Array {
    mutating func dj_addObject(_ safeObject:Iterator.Element?) {
        if let obj = safeObject {
            self.append(obj)
        } else {
            print("Warning! Array:\(self) add an nil element!")
        }
    }
    
    mutating func dj_removeAt(_ index: Int) {
        if index >= self.count {
            print("Warning! Array:\(self) remove object at index: '\(index)' is out of range")
        } else {
            self.remove(at: index)
        }
    }
    
    mutating func dj_insertAt(_ object: Iterator.Element?, _ index: Int) {
        if object == nil {
            print("Warning! Array:\(self) can not insert an nil element at index: '\(index)'")
            return
        }
        if index > self.count {
            print("Warning! Array:\(self) insert an element at index: '\(index)' is out of range!")
            return
        }
        self.insert(object!, at: index)
    }
}

extension Array {
    subscript (safe index: Int) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func dj_objectAt(_ index: Int) -> Iterator.Element? {
        if index < self.count {
            return self[index]
        } else {
            print("Warning! Array:\(self) object index: '\(index)' is out of bounds (0, \(self.count))")
            return nil
        }
    }
    
    func dj_stringAt(_ index: Int) -> String {
        let value = self.dj_objectAt(index)
        if value == nil {
            return ""
        }
        if let s = value as? String {
            return s
        }
        if let i = value as? Int {
            return i.description
        }
        if let d = value as? Double {
            return d.description
        }
        return ""
    }
    
    func dj_intAt(_ index: Int) -> Int {
        let value = self.dj_objectAt(index)
        if value == nil {
            return 0
        }
        if let s = value as? String {
            if let n = Int(s) {
                return n
            } else {
                print("Warning! Array:\(self) at index:\(index) value:\(s) is not cover to Int!")
                return 0
            }
        }
        if let i = value as? Int {
            return i
        }
        if let d = value as? Double {
            return Int(d)
        }
        return 0
    }
    
    func dj_doubleAt(_ index: Int) -> Double {
        let value = self.dj_objectAt(index)
        if value == nil {
            return 0.0
        }
        if let s = value as? String {
            if let n = Double(s) {
                return n
            } else {
                print("Warning! Array:\(self) at index:\(index) value:\(s) is not cover to Double!")
            }
        }
        if let i = value as? Int {
            return Double(i)
        }
        if let d = value as? Double {
            return d
        }
        return 0.0
    }
    
}


extension Dictionary {
    mutating func dj_set(_ key: Dictionary.Key, _ value: Dictionary.Value?) {
        if let o = value {
            self[key] = o
        } else {
            print("Warning! Dictionary:\(self) append an nil value key is '\(key)'")
        }
    }
    
    func dj_object(_ key: Dictionary.Key) -> Dictionary.Value? {
        let value = self[key]
        if value == nil {
            return nil
        }
        return value
    }
    
    func dj_string(_ key:Dictionary.Key) -> String {
        let value = self[key]
        if value == nil {
            return ""
        }
        if let s = value as? String {
            return s
        }
        if let i = value as? Int {
            return i.description
        }
        if let d = value as? Double {
            return d.description
        }
        return ""
    }
    
    func dj_int(_ key: Dictionary.Key) -> Int {
        let value = self[key]
        if value == nil {
            return 0
        }
        if let s = value as? String {
            if let n = Int(s) {
                return n
            } else {
                print("Warning! Dictionary:\(self) for key:'\(key)' value:'\(s)' is not cover to Int!")
                return 0
            }
        }
        if let i = value as? Int {
            return i
        }
        if let d = value as? Double {
            return Int(d)
        }
        return 0
    }
    
    func dj_double(_ key: Dictionary.Key) -> Double{
        let value = self[key]
        if value == nil {
            return 0.0
        }
        if let s = value as? String {
            if let n = Double(s) {
                return n
            } else {
                print("Warning! Dictionary:\(self) for key:'\(key)' value:'\(s)' is not cover to Double!")
                return 0.0
            }
        }
        if let i = value as? Int {
            return Double(i)
        }
        if let d = value as? Double {
            return d
        }
        return 0.0
    }
    
}

