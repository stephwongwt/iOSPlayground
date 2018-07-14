//: Playground - noun: a place where people can play

import UIKit

var a = [[1,2,3],[4,5,6],[7,8,9]]
var b = [1,2,3]

b.contains(1)

if a[0] == b {
    print("true")
}
let c = b.prefix(1)
print(c)
print(a)      




var array = [0, 1, 2, 3, 4, 5]
if array.count > 3 {
    array.removeRange(3..<array.count)
}

print(array)