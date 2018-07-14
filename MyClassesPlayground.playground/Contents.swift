//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class A{
    class func classFunction(){
        print("classFunction")
    }
    static func staticFunction(){
        print("staticFunction")
    }
    class func classFunctionToBeMakeFinalInImmediateSubclass(){
    }
    class func returnClassFunc() -> String {
        return "returnClassFunc"
    }
    static func returnStaticFunc() -> String {
        return "returnStaticFunc"
    }
}
var a: A

A.classFunction()
A.staticFunction()
A.returnClassFunc()
A.returnStaticFunc()

class C: A {
    override class func classFunction () {
        print("overridden classFunction")
    }
//    override static func staticFunction () {
//        print("overridden staticFunction")
//    }
    override class func returnClassFunc () -> String {
        return "overriden returnClassFunc"
    }
//    override static func returnStaticFunc () -> String {
//        return "overriden returnStaticFunc"
//    }
}

C.classFunction()
C.staticFunction()
C.returnClassFunc()
C.returnStaticFunc()

class B {
    var one: String?
    var two: String?
    static var onetoo: String?
    static var twotoo: String?
    
    init? (one: String, two: String) {
        self.one = one
        self.two = two
    }
    
    func getitems () -> String { //this needs to be initialized
        return ("\(one!) \(two!)")
    }
    
    static func getitemstoo () -> String {
        return ("\(onetoo!) \(twotoo!)")
    }
}

let b:B = B(one: "hello", two: "world")!
b.getitems()
b.one = "helloo"
b.two = "world!"
b.getitems()


B.onetoo = "world"
B.twotoo = "hello"
B.getitemstoo()






let userCalendar = NSCalendar.currentCalendar()
let dateMaker = NSDateFormatter()
dateMaker.dateFormat = "yyyy/MM/dd hh:mm:ss Z"
let groundhogDay = dateMaker.dateFromString("2015/02/02 00:00:00 +08:00")!
let groundhogDayPlus1Second = dateMaker.dateFromString("2015/02/02 00:00:01 +08:00")!

userCalendar.compareDate(groundhogDay,
    toDate: groundhogDayPlus1Second,
    toUnitGranularity: .Minute)
    == .OrderedSame




// --------------- CLOSURES ---------------

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

var incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()





func someFunctionWithNoescapeClosure(@noescape closure: () -> Void) {
    closure()
}

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoescapeClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// prints "200"

completionHandlers.first?()
print(instance.x)
// prints "100"





var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// prints "5"

let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)
// prints "5"

print("Now serving \(customerProvider())!")
// prints "Now serving Chris!"
print(customersInLine.count)
// prints "4"







