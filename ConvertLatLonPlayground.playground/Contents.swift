//: Playground - noun: a place where people can play

import UIKit
import CoreLocation

var str = "Hello, playground"
var latStr:String?
var lonStr:String?
let currLat = CLLocationDegrees(1.335271)
let currLon = CLLocationDegrees(103.941073)
let currLoc = CLLocation(latitude: currLat, longitude: currLon)

latStr = "1.302128000000000"
lonStr = "103.864082000000000"
print(latStr)

let latDbl = Double(latStr!)
let lonDbl = Double(lonStr!)

let latCLD = CLLocationDegrees(latDbl!)
let lonCLD = CLLocationDegrees(lonDbl!)
let cinLoc = CLLocation(latitude: latDbl!, longitude: lonDbl!)
let ncinLoc = CLLocation(latitude: Double(latStr!)! as Double, longitude: Double(lonStr!)! as Double)

print(currLoc.distanceFromLocation(cinLoc)/1000)