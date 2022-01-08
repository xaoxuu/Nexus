import XCTest
@testable import Nexus

final class NexusTests: XCTestCase {
    func testArray() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let a1 = [1,2,3]
        let a2 = ["a", "b", 3, a1] as [Any]
        
        
        print(a1.nexus.stringValueForPrint)
        print(a2.nexus.stringValueForPrint)
        print(a2.nexus.stringValue ?? "")
        
        let data = a1.nexus.dataValue
        
        let str = data?.nexus.stringValue
        
        print("str: ", str ?? "")
        
    }
    
    func testString() throws {
        
        let s1 = "123"
        let s2 = "[1,2,3]"
        let s3 = "{\"aa\": 123123}"
        
        let bools = ["yes", "no", "YES", "NO", "true", "false", "1", "0", "2", "-1"]
        bools.forEach { print("\($0) boolValue:", $0.nexus.boolValue ?? "nil") }
        
        print("\(s1) doubleValue:", s1.nexus.doubleValue ?? "nil")
        print("\(s1) intValue:", s1.nexus.intValue ?? "nil")
        
        print("\(s2) arrayValue:", s2.nexus.arrayValue ?? "nil")
        print("\(s2) dictionaryValue:", s2.nexus.dictionaryValue ?? "nil")
        
        print("\(s3) arrayValue:", s3.nexus.arrayValue ?? "nil")
        print("\(s3) dictionaryValue:", s3.nexus.dictionaryValue ?? "nil")
        
        
    }
}
