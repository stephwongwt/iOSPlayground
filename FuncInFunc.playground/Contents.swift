//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func sum(a: Int, b: Int = 5) -> Int {
    return a + b
}
var addition: (Int, Int) -> Int = sum
print("Result: \(addition(40, 89))")

func another(addition: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(addition(a, b))")
}
another(sum, a: 10, b: 20)


func calcDecrement(forDecrement total: Int) -> () -> [Int] {
    var overallDecrement = 0
    func decrementer() -> [Int] {
        overallDecrement -= total
        return [total,overallDecrement]
    }
    return decrementer
}
let decrem = calcDecrement(forDecrement: 30)
print(decrem())
print(decrem())
print(decrem())




func printFirstName(surname:String="Blow",firstName:String="Joe",middleName:String="Andrew") -> String {
     return "\(firstName) \(middleName) \(surname)"
}
printFirstName()
printFirstName(firstName: "John", middleName: "Juan", "Smith")    //prints John Juan Smith
printFirstName(firstName: "John")    //parameters left out! prints John Andrew Blow
printFirstName(firstName: "John", "Smith", middleName: "Julius")    //parameters out of order! prints John Julius Smith




func intAdder(x: Int, y: Int) -> Int{
    return(x + y)
}
intAdder(3, y: 4) // 7

func sideEffectAdder(x:Int, y:Int) -> Void {
    print("Added value is \(x + y)")
}
sideEffectAdder(3, y: 4) // prints "Added value is 7"

func aSideEffectAdder(x:Int, y:Int) {
    print("Added value is \(x + y)")
}
aSideEffectAdder(3, y: 4) // prints "Added value is 7"


func intAdder2(firstNum x: Int, secondNum y: Int)-> Int{
    return(x + y)
}
intAdder2(firstNum: 3, secondNum: 4)

func intAdder3(x x: Int, y: Int) -> Int {
    return(x + y)
}
intAdder3(x: 3, y: 4)



func sayHello(names:String...)-> String{
//    let names = " and ".join(names)
    let names = names.joinWithSeparator(" and ")
    
    return("Hello to \(names)")
}
sayHello("Jack") // Hello to Jack
sayHello("Jack", "Jill") // Hello to Jack and Jill



func evenAdder(x:Int, y:Int) -> Int? {
    let even = (x % 2 == 0, y % 2 == 0)
    switch even{
    case (true, true):
        return (x + y)
    default:
        return nil
    }
}
evenAdder(2, y: 4) // {Some 6}
evenAdder(2, y: 3) // nil



func getNewMail () -> (code: Int, message: String) {
    return (200, "OK")
}
getNewMail()

typealias Response = (code: Int, message: String)

var result:Response
result = (500, "Internal Server Error")

func getNewMail2 () -> Response {
    return (200, "OK")
}
getNewMail2()



func capitalize(s:String) -> String {
    return s.capitalizedString
}
capitalize("hello") // "Hello"

func applyToString(s:String, f:(String)->String) -> String {
    return(f(s))
}
applyToString("hello", f: capitalize) // "Hello"

["a", "b", "c"].map(capitalize) // ["A", "B", "C"]



func makeLogger() -> (String) -> String {
    func log(s:String) -> String {
        print(s)
        return(s)
    }
    return(log)
}

let myCustomLog = makeLogger()
myCustomLog("I am a message") // I am a message



let nums = [1, 3, 5, 7]

func doubler(x:Int) -> Int{
    return(x * 2)
}

let fnDoubledNums = nums.map(doubler) // [2, 6, 10, 14]

let closureDoubledNums = nums.map({ $0 * 2 })
closureDoubledNums // [2, 6, 10, 14]

let trailingClosureDoubledNums = nums.map() {
    (num:Int) -> Int in
    return(num * 2)
}
trailingClosureDoubledNums // [2, 6, 10, 14]

let trailingClosureDoubledNums2 = nums.map() { $0 * 2 }
trailingClosureDoubledNums2 // [2, 6, 10, 14]


func makeMultiplier(multiplier:Int) -> (Int) -> Int {
    return {
        (num:Int) -> Int in
        return(num * multiplier)
    }
}

let doubler2 = makeMultiplier(2) // (Function)
doubler2(10)       // 10
let tripler = makeMultiplier(3) // (Function)
tripler(10)        // 30
nums.map(doubler2) // [2, 6, 10, 14]
nums.map(tripler)  // [3, 9, 15, 21]



func makeLevelledLogger(level:String) -> (String) -> String {
return {
    (message:String) -> String in
        let logMessage = "\(level) :: \(message)"
        print(logMessage)
        return(logMessage)
    }
}
let debug = makeLevelledLogger("DEBUG")
let warning = makeLevelledLogger("WARNING")
let message = makeLevelledLogger("MESSAGE")

debug("A message from our debug logger") // "DEBUG :: A message from our debug
                                        // logger"
warning("Consider yourself warned")     // "WARNING :: Consider yourself warned"

message("Life, the universe, and everything...") // "MESSAGE :: Life, the
                                                //universe, and everything is..."































