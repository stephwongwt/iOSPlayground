//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class IncDateTime { //converts various update times and such into date or time formats that I want
    
    let dateFormatter = NSDateFormatter()
    required init() {
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    }
    
    func strToDatetime (dateStr:String, format:String = "yyyy-MM-dd hh:mm:ss.SSS") -> NSDate {
        //        let dateFormatter = NSDateFormatter()
        //        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(dateStr)!
    }
    
    
    func datetimeToStr (date:NSDate, format:String = "yyyy-MM-dd hh:mm:ss") -> String {
        //        let dateFormatter = NSDateFormatter()
        //        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(date)
    }
    
    func compareTwoDatesFromStrings (oldDatetime: String, newDatetime: String, format: String = "yyyy-MM-dd hh:mm:ss.SSS") -> Bool {
        let userCalendar = NSCalendar.currentCalendar()
        //        let dateMaker = NSDateFormatter()
        //        dateMaker.dateFormat = format
        //        let oldDay = dateMaker.dateFromString(oldDatetime)!
        //        let newDay = dateMaker.dateFromString(newDatetime)!
        dateFormatter.dateFormat = format
        let oldDay = dateFormatter.dateFromString(oldDatetime)!
        let newDay = dateFormatter.dateFromString(newDatetime)!
        
        //compare if they are the same time with accuracy to minutes
        return userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Minute) == .OrderedSame
        
        //        if userCalendar.compareDate(oldDay, toDate: newDay, toUnitGranularity: .Minute) == .OrderedSame {
        //            return true
        //        } else {
        //            return newDay.isGreaterThanDate(oldDay)
        //        }
        
    }
    
    func checkIfTimeHasPassed (timeToCheck: String, addFiveMin: Bool = false, format: String = "yyyy-MM-dd HH:mm:ss") -> Bool { //"h:mma"
        //        let userCalendar = NSCalendar.currentCalendar()
        dateFormatter.dateFormat = format
        //        print("timeToCheck \(timeToCheck)")
        let theTimeToCheck = dateFormatter.dateFromString(timeToCheck)
        let currentTime = NSDate()
        //        print("theTimeToCheck \(theTimeToCheck) and currentTime \(currentTime)")
        if addFiveMin { //need to add 5 mins
            theTimeToCheck?.addMins(5)
            return theTimeToCheck!.isGreaterThanDate(currentTime) // return true if time is valid
        } else { //dont add 5 mins
            return theTimeToCheck!.isGreaterThanDate(currentTime) // return true if time is valid
        }
    }
    
    func daysDifference (oldDatetime: String, newDatetime: String, format: String = "M/d/yyyy") -> Int {
        let userCalendar = NSCalendar.currentCalendar()
        //        let dateMaker = NSDateFormatter()
        //        dateMaker.dateFormat = format
        //        let oldDay = dateMaker.dateFromString(oldDatetime)!
        //        let newDay = dateMaker.dateFromString(newDatetime)!
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
    
    func prettifyShowdate (dateStr: String) -> String{
        //        let dateFormatter = NSDateFormatter()
        //        dateFormatter.timeZone = NSTimeZone(name: "Asia/Singapore")
        dateFormatter.dateFormat = "M/d/yyyy"
        
        let date = dateFormatter.dateFromString(dateStr)
        dateFormatter.dateFormat = "dd MMM yyyy"
        
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
}

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
var inc = IncDateTime()
let dayStr = "8/4/2016"
let day = inc.strToDatetime(dayStr, format: "M/d/yyyy")
let mystr = timeAgoSinceDate(day, numericDates: true)
print("hello?")
print(mystr)













