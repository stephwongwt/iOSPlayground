//: Playground - noun: a place where people can play

import UIKit

extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

var showtimeAvailableArr = [["showtimes_id":1298933,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 11:00:00","showtimes_session_time":"11:00AM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1100&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298934,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 12:00:00","showtimes_session_time":"12:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1200&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298810,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 12:00:00","showtimes_session_time":"12:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02*&hFilmCode=5634&hShowTimeInt=1200&hShowDate=24-02-2016&hLocationName=D-BOX, Bishan ","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298815,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 12:00:00","showtimes_session_time":"12:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5634&hShowTimeInt=1200&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298816,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 14:30:00","showtimes_session_time":"2:30PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5634&hShowTimeInt=1430&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298811,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 14:30:00","showtimes_session_time":"2:30PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02*&hFilmCode=5634&hShowTimeInt=1430&hShowDate=24-02-2016&hLocationName=D-BOX, Bishan ","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298935,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 14:30:00","showtimes_session_time":"2:30PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1430&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298936,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 16:10:00","showtimes_session_time":"4:10PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1610&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298937,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 17:00:00","showtimes_session_time":"5:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1700&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298812,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 17:00:00","showtimes_session_time":"5:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02*&hFilmCode=5634&hShowTimeInt=1700&hShowDate=24-02-2016&hLocationName=D-BOX, Bishan ","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298817,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 17:00:00","showtimes_session_time":"5:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5634&hShowTimeInt=1700&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298938,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 18:40:00","showtimes_session_time":"6:40PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1840&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298939,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 19:30:00","showtimes_session_time":"7:30PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=1930&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298818,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 19:30:00","showtimes_session_time":"7:30PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5634&hShowTimeInt=1930&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298813,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 19:30:00","showtimes_session_time":"7:30PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02*&hFilmCode=5634&hShowTimeInt=1930&hShowDate=24-02-2016&hLocationName=D-BOX, Bishan ","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298940,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 21:10:00","showtimes_session_time":"9:10PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=2110&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298941,"showtimes_movie_group_id":1033,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":5,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 22:00:00","showtimes_session_time":"10:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5581&hShowTimeInt=2200&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298814,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 22:00:00","showtimes_session_time":"10:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02*&hFilmCode=5634&hShowTimeInt=2200&hShowDate=24-02-2016&hLocationName=D-BOX, Bishan ","showtimes_updatedate":"2/24/2016 10:24:14 AM"],["showtimes_id":1298819,"showtimes_movie_group_id":1032,"showtimes_movie_id":476,"showtimes_cinema_id":29,"showtimes_movieformat_id":4,"showtimes_tickettype_id":7,"showtimes_session_date_display":"2/24/2016","showtimes_session_date_actual":"2/24/2016","showtimes_session_datetime_actual":"2016-02-24 22:00:00","showtimes_session_time":"10:00PM","showtimes_exhibitor_id":1,"showtimes_session_link":"https://www.gv.com.sg/servlet/BkSeatingPlanServlet?gvAction=getSeatingPlan&hLocationCode=02&hFilmCode=5634&hShowTimeInt=2200&hShowDate=24-02-2016&hLocationName=GV Bishan","showtimes_updatedate":"2/24/2016 10:24:14 AM"]]

let uniqueIdentifierKey = 99 //actually need to be calculated
var cinemaArr = [Int]()
var formatsArr = [Int]()
var TickettypeArr = [Int]()
var uniqueNumberForCinemas = [Int:[Int]]() //["cinemaId":[1,2,6],"cinemaId":[1,4,6]]
var uniqueNumberPairForCinemas = [Int:[Int:[Int]]]() //["cinemaId":[1:[9,8],2:[9,8],6:[9,8]],"cinemaId":[1:[9,8],4:[9,8],6:[9,8]]]
var twoDForCinemas = [Int:[[Int]]]() //["cinemaId":[[9,8],[9,8],[9,8]],"cinemaId":[[9,8],[9,8],[9,8]]]
var timeArr = [Int:[Int:[String:String]]]() //["cinemaId":[1:["1:00PM":Link],2:["1:00PM","2:00PM"]],"cinemaId":[1:["1:00PM","2:00PM"],4:["1:00PM"],6:["2:00PM"]]]

for showtime in showtimeAvailableArr {
    print("-----start of for loop-----")
    
    let sId = showtime["showtimes_id"] as! Int
    let sMovieId = showtime["showtimes_movie_id"] as! Int
    let sCinemaId = showtime["showtimes_cinema_id"] as! Int
    let sFormatId = showtime["showtimes_movieformat_id"] as! Int
    let sTicketTypeId = showtime["showtimes_tickettype_id"] as! Int
    let sSessDateDisplay = showtime["showtimes_session_date_display"] as! String
    let sSessDateActual = showtime["showtimes_session_date_actual"] as! String
    let sSessDatetimeActual = showtime["showtimes_session_datetime_actual"] as! String
    let sSessTime = showtime["showtimes_session_time"] as! String
    let sExhibitorId = showtime["showtimes_exhibitor_id"] as! Int
    let sSessLink = showtime["showtimes_session_link"] as! String
    let sUpdateDate = showtime["showtimes_updatedate"] as! String

    if !(cinemaArr.contains(sCinemaId)) {
        cinemaArr.append(sCinemaId)
    }
    
    if !(formatsArr.contains(sFormatId)) {
        formatsArr.append(sFormatId)
    }
    
    if !(TickettypeArr.contains(sTicketTypeId)) {
        TickettypeArr.append(sTicketTypeId)
    }
    
    let uniquePair = [sTicketTypeId, sFormatId]
    let uniquePairIdentifier = uniquePair[1] * uniqueIdentifierKey + uniquePair[0]
    print("uniquePairIdentifier \(uniquePairIdentifier)")
//    print("sSessTime \(sSessTime)")
    
    if uniqueNumberForCinemas.keys.contains(sCinemaId) {
        //cinemaid exists in dictionary
        var valueForKey = uniqueNumberForCinemas[sCinemaId]
        if !(valueForKey!.contains(uniquePairIdentifier)) {
            valueForKey!.append(uniquePairIdentifier)
            uniqueNumberForCinemas.updateValue(valueForKey!, forKey: sCinemaId)
        }
    } else {
        //the dictionary didnt have the cinemaId in it
        uniqueNumberForCinemas[sCinemaId] = [uniquePairIdentifier]
    }
    
    
    
    if uniqueNumberPairForCinemas.keys.contains(sCinemaId) {
        //cinemaid exists in dictionary
//        print("  cinemaid exists in dictionary")
        var valueForKey = uniqueNumberPairForCinemas[sCinemaId]
//        print("  valueForKey \(valueForKey)")
        if !(valueForKey!.keys.contains(uniquePairIdentifier)) {
//            print("    uniquePairIdentifier(\(uniquePairIdentifier)) doesnt exist")
            uniqueNumberPairForCinemas[sCinemaId]![uniquePairIdentifier] = uniquePair
        }
    } else {
        //the dictionary didnt have the cinemaId in it
//        print("  the dictionary didnt have the cinemaId in it")
        uniqueNumberPairForCinemas[sCinemaId] = [uniquePairIdentifier: uniquePair]
//        print(uniqueNumberPairForCinemas[sCinemaId]!)
//        print(uniqueNumberPairForCinemas[sCinemaId]![uniquePairIdentifier])
    }
    
    
    
    if timeArr.keys.contains(sCinemaId) { //["cinemaId":[1:["1:00PM"],2:["1:00PM","2:00PM"]],"cinemaId":[1:["1:00PM","2:00PM"],4:["1:00PM"],6:["2:00PM"]]]
        //cinemaid exists in dictionary
//        print("  cinemaid exists in dictionary")
        var valueForKey = timeArr[sCinemaId]
//        print("  valueForKey \(valueForKey)")
        if !(valueForKey!.keys.contains(uniquePairIdentifier)) {
//            print("    uniquePairIdentifier(\(uniquePairIdentifier)) doesnt exist")
//            print("    \(timeArr[sCinemaId]![uniquePairIdentifier])")
            timeArr[sCinemaId]![uniquePairIdentifier] = [sSessTime:sSessLink]
//            print("    \(timeArr[sCinemaId]![uniquePairIdentifier])")
        } else {
//            print("    uniquePairIdentifier(\(uniquePairIdentifier)) exist")
            timeArr[sCinemaId]![uniquePairIdentifier]?[sSessTime] = sSessLink
//            print("    \(timeArr[sCinemaId]![uniquePairIdentifier]!)")
        }
    } else {
        //the dictionary didnt have the cinemaId in it
//        print("  the dictionary didnt have the cinemaId in it")
        timeArr[sCinemaId] = [uniquePairIdentifier: [sSessTime:sSessLink]]
//        print(timeArr[sCinemaId]!)
//        print(timeArr[sCinemaId]![uniquePairIdentifier])
    }
    
    
    
    if twoDForCinemas.keys.contains(sCinemaId) {
        //cinemaid exists in dictionary
        print("  cinemaid exists in dictionary")
        var valueForKey = twoDForCinemas[sCinemaId]
        print("  valueForKey \(valueForKey)")
        for values in valueForKey! {
            print("    values \(values)")
            print("    uniquePair \(uniquePair)")
            if values[0] != uniquePair[0] || values[1] != uniquePair[1] {
                print("      not same, append!")
                valueForKey!.append(uniquePair)
                twoDForCinemas.updateValue(valueForKey!, forKey: sCinemaId)
                print("      new valueForKey \(valueForKey)")
                break
            } else {
                break
            }
        }
    } else {
        //the dictionary didnt have the cinemaId in it
        print("  the dictionary didnt have the cinemaId in it")
        twoDForCinemas[sCinemaId] = [uniquePair]
        print(twoDForCinemas[sCinemaId]!)
    }
    
    print("-----end of for loop-----")
    print("   ")
}

func makeUniqueArray<T: Equatable>(aCollection: Array<T>) -> Array<T>
{
    var collection = Array<T>()
    
    for element: T in aCollection
    {
        if !collection.contains(element)
        {
            collection.append(element)
        }
    }
    
    return collection
}

print(twoDForCinemas)
for item in twoDForCinemas.values {
    let newitem = makeUniqueArray(item)
    var itemKey: Int!
    for (keys, array) in twoDForCinemas {
        if array == item {
            itemKey = keys
        }
    }
    twoDForCinemas.updateValue(newitem as NSArray as! [[Int]], forKey: itemKey)
}

print("----------Print Results----------")
print("totalNoOfShowtimes = \(showtimeAvailableArr.count)")
//print("cinemaArr \(cinemaArr)")
//print("formatsArr \(formatsArr)")
//print("TickettypeArr \(TickettypeArr)")
print("twoDForCinemas \(twoDForCinemas)")
//print("uniqueNumberForCinemas \(uniqueNumberForCinemas)")
print("uniqueNumberPairForCinemas \(uniqueNumberPairForCinemas)")
print("timeArr \(timeArr)")
print("----------END Results----------")
//print(uniqueNumberPairForCinemas[11]!) // cinemaId
//print(uniqueNumberPairForCinemas[11]![501]) //cinemaId + uniqueNumber
print("uniqueNumberForCinemas[29]![0] \(uniqueNumberForCinemas[29]![0])")
print("uniqueNumberPairForCinemas[29]!.count \(uniqueNumberPairForCinemas[29]![uniqueNumberForCinemas[29]![0]])")
//print(" ")
//print(timeArr[7]!) // cinemaId
//print(timeArr[7]![501]) //cinemaId + uniqueNumber
//print(timeArr[7]![501]?.count)
//print(timeArr[7]![501]!["1:00PM"])






























































































