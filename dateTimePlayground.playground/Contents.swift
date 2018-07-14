//
//  DatetimeHandler.swift
//  testIncWebServiceTwo
//
//  Created by ITCODE on 29/3/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import Foundation

class DateTimeHandler {
    static let sharedInstance = DateTimeHandler()
    
    let dateFormatter = NSDateFormatter()
    required init() {
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    }
    
    func strToDatetime (dateStr:String, format:String = "yyyy-MM-dd hh:mm:ss.SSS") -> NSDate {
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(dateStr)!
    }
    
    func datetimeToStr (date:NSDate, format:String = "yyyy-MM-dd hh:mm:ss") -> String {
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(date)
    }
    
    func compareTwoDatesFromStrings (oldDatetime: String, newDatetime: String, format: String = "yyyy-MM-dd hh:mm:ss.SSS") -> Bool {
        let userCalendar = NSCalendar.currentCalendar()
        dateFormatter.dateFormat = format
        let oldDay = dateFormatter.dateFromString(oldDatetime)!
        let newDay = dateFormatter.dateFromString(newDatetime)!
        
        //compare if they are the same time with accuracy to minutes
        return userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Minute) == .OrderedSame
    }
    
    func checkIfTimeHasPassed (timeToCheck: String, addFiveMin: Bool = false, format: String = "yyyy-MM-dd HH:mm:ss") -> Bool {
        dateFormatter.dateFormat = format
        let theTimeToCheck = dateFormatter.dateFromString(timeToCheck)!.addHours(-6)
        //        let currentTime = NSDate()
        let currentTime = NSDate().addHours(-6) //based on incinemas time
        if addFiveMin { //need to add 5 mins
            theTimeToCheck.addMins(5)
            return theTimeToCheck.isGreaterThanDate(currentTime) // return true if time is valid
        } else { //dont add 5 mins
            return theTimeToCheck.isGreaterThanDate(currentTime) // return true if time is valid
        }
    }
    
    func checkIfDayHasPassed (dayToCheck: NSDate) -> Bool { //2016-03-28 13:00:00 +0000
        let currentDay = NSDate()
        return dayToCheck.isLessThanDate(currentDay) // return true if time is valid
    }
    
    func daysDifference (oldDatetime: String, newDatetime: String, format: String = "M/d/yyyy") -> Int {
        let userCalendar = NSCalendar.currentCalendar()
        dateFormatter.dateFormat = format
        let oldDay = dateFormatter.dateFromString(oldDatetime)!
        let newDay = dateFormatter.dateFromString(newDatetime)!
        
        //compare if they are the same time with accuracy to minutes
        if userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Day) == .OrderedSame {
            return 0
        } else {
            return userCalendar.components(.Day, fromDate: oldDay, toDate: newDay, options: []).day
        }
        
    }
    
    func isToday (datetime: String, format: String = "M/d/yyyy") -> Bool {
        // when i check if it's today, i need to offset the time by 6 hours.
        // real life time is 10 may, 5am, incinemas time it is, 9may 11pm
        let userCalendar = NSCalendar.currentCalendar()
        dateFormatter.dateFormat = format
        let dateToCheck = dateFormatter.dateFromString(datetime)!
        //        let today = NSDate()
        let today = NSDate().addHours(-6) //based on incinemas time
        
        //compare if they are the same time with accuracy to minutes
        if userCalendar.compareDate(dateToCheck, toDate: today, toUnitGranularity: .Day) == .OrderedSame {
            return true
        } else {
            return false
        }
        
    }
    
    func prettifyShowdate (dateStr: String, addDay: Bool = false, shortened: Bool = false) -> String{
        dateFormatter.dateFormat = "M/d/yyyy"
        
        let date = dateFormatter.dateFromString(dateStr)
        if addDay {
            if shortened {
                dateFormatter.dateFormat = "dd MMM yyyy, EEE"
            } else {
                dateFormatter.dateFormat = "dd MMM yyyy, EEEE"
            }
        } else {
            dateFormatter.dateFormat = "dd MMM yyyy"
        }
        
        return dateFormatter.stringFromDate(date!)
    }
    
    func prettifyShowdateForStack (dateStr: String) -> [String] {
        dateFormatter.dateFormat = "M/d/yyyy"
        let date = dateFormatter.dateFromString(dateStr)
        
        dateFormatter.dateFormat = "dd MMM"
        let shortDate = dateFormatter.stringFromDate(date!)
        
        dateFormatter.dateFormat = "EEEE"
        let dateDay = dateFormatter.stringFromDate(date!)
        
        return [shortDate,dateDay]
    }
    
    // get timeago
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return "\(components.year) years ago"
        } else if (components.year >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month >= 2) {
            return "\(components.month) months ago"
        } else if (components.month >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear) weeks ago"
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day >= 2) {
            return "\(components.day) days ago"
        } else if (components.day >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour >= 2) {
            return "\(components.hour) hours ago"
        } else if (components.hour >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute >= 2) {
            return "\(components.minute) minutes ago"
        } else if (components.minute >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second >= 3) {
            return "\(components.second) seconds ago"
        } else {
            return "Just now"
        }
    }
    
//    func getFilterTimeTag(sessionTime: String) -> FilterTimeTag {
//        
//        let now = NSDate()
//        
//        let timeToCheck = now.dateAt(<#T##hours: Int##Int#>, minutes: <#T##Int#>)
//        
//        let morningMin = now.dateAt(filterTimes.midnight["min"]!["hr"]!, minutes: filterTimes.midnight["min"]!["min"]!)
//        let morningMax = now.dateAt(filterTimes.midnight["max"]!["hr"]!, minutes: filterTimes.midnight["max"]!["min"]!)
//        let noonMin = now.dateAt(filterTimes.midnight["min"]!["hr"]!, minutes: filterTimes.midnight["min"]!["min"]!)
//        let noonMax = now.dateAt(filterTimes.midnight["max"]!["hr"]!, minutes: filterTimes.midnight["max"]!["min"]!)
//        let eveningMin = now.dateAt(filterTimes.midnight["min"]!["hr"]!, minutes: filterTimes.midnight["min"]!["min"]!)
//        let eveningMax = now.dateAt(filterTimes.midnight["max"]!["hr"]!, minutes: filterTimes.midnight["max"]!["min"]!)
//        let midnightMin = now.dateAt(filterTimes.midnight["min"]!["hr"]!, minutes: filterTimes.midnight["min"]!["min"]!)
//        let midnightMax = now.dateAt(filterTimes.midnight["max"]!["hr"]!, minutes: filterTimes.midnight["max"]!["min"]!)
//        
//        return FilterTimeTag.Midnight
//    }
}

extension NSDate {
    
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
    }
    func isLessThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
    }
    func addDays(daysToAdd : Int) -> NSDate
    {
        let secondsInDays : NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        
        return self.dateByAddingTimeInterval(secondsInDays)
    }
    func addHours(hoursToAdd : Int) -> NSDate
    {
        let secondsInHours : NSTimeInterval = Double(hoursToAdd) * 60 * 60
        
        return self.dateByAddingTimeInterval(secondsInHours)
    }
    func addMins(minsToAdd : Int) -> NSDate
    {
        let secondsInMins : NSTimeInterval = Double(minsToAdd) * 60
        
        return self.dateByAddingTimeInterval(secondsInMins)
    }
    
    
    //http://stackoverflow.com/questions/27182023/getting-the-difference-between-two-nsdates-in-months-days-hours-minutes-seconds
    func yearsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
    }
    func monthsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
    }
    func weeksFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
    }
    func daysFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
    }
    func hoursFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
    }
    func minutesFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
    }
    func secondsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
    }
    func offsetFrom(date:NSDate) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
        return ""
    }
    
    
    /**
     This adds a new method dateAt to NSDate.
     
     It returns a new date at the specified hours and minutes of the receiver
     
     :param: hours: The hours value
     :param: minutes: The new minutes
     
     :returns: a new NSDate with the same year/month/day as the receiver, but with the specified hours/minutes values
     */
    func dateAt(hours: Int, minutes: Int) -> NSDate
    {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        //get the month/day/year componentsfor today's date.
        
        print("Now = \(self)")
        
        let date_components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day],
                                                  fromDate: self)
        
        //Create an NSDate for 8:00 AM today.
        date_components.hour = hours
        date_components.minute = minutes
        date_components.second = 0
        
        let newDate = calendar.dateFromComponents(date_components)!
        return newDate
    }
}

//-------------------------------------------------------------
//Tell the system that NSDates can be compared with ==, >, >=, <, and <= operators
//extension NSDate: Equatable {}
extension NSDate: Comparable {}

//-------------------------------------------------------------
//Define the global operators for the
//Equatable and Comparable protocols for comparing NSDates

public func ==(lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}
public func >(lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs.timeIntervalSince1970 > rhs.timeIntervalSince1970
}
public func <=(lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs.timeIntervalSince1970 <= rhs.timeIntervalSince1970
}
public func >=(lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs.timeIntervalSince1970 >= rhs.timeIntervalSince1970
}
//-------------------------------------------------------------


//convert time(10:00AM | 1:50PM) to date(today) time
let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

let now = NSDate()
let date_components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: now)

let sessionTime = "10:00AM"
let sessionDatetime = DateTimeHandler.sharedInstance.strToDatetime(sessionTime, format: "h:mma")
let datetime_components = calendar.components([NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: sessionDatetime)

//create the session datetime
datetime_components.year = date_components.year
datetime_components.month = date_components.month
datetime_components.day = date_components.day

let sessionTimeInToday = calendar.dateFromComponents(datetime_components)


now.dateAt(datetime_components.hour, minutes: datetime_components.minute)


let time = "Morning (6:00am - 11:59am)"
time.lowercaseString.containsString("morning")

let arrrrr = ["a", "b", "c"]

if arrrrr.contains("a") {
    print("has a")
} else if arrrrr.contains("b") {
    print("has b")
}











