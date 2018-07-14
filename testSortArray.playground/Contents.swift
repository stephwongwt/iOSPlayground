//: Playground - noun: a place where people can play

import UIKit

class showtime {
    var exhibitorTitle: String
    var cinemaName: String
    
    init (exhibitorTitle: String, cinemaName:String) {
        self.exhibitorTitle = exhibitorTitle
        self.cinemaName = cinemaName
    }
    
}

var array = [showtime(exhibitorTitle: "Cathay", cinemaName: "AMK Hub"),
             showtime(exhibitorTitle: "Cathay", cinemaName: "Causeway Point"),
             showtime(exhibitorTitle: "Cathay", cinemaName: "Cineleisure Orchard"),
             showtime(exhibitorTitle: "Cathay", cinemaName: "Downtown East"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Nex"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Seletar"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Waterway Point"),
             showtime(exhibitorTitle: "WE Cinemas", cinemaName: "Clementi"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Katong"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Plaza"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Suntec City"),
             showtime(exhibitorTitle: "Cathay", cinemaName: "Jem"),
             showtime(exhibitorTitle: "Cathay", cinemaName: "The Cathay"),
             showtime(exhibitorTitle: "Cathay", cinemaName: "West Mall"),
             showtime(exhibitorTitle: "Filmgarde", cinemaName: "Bugis+"),
             showtime(exhibitorTitle: "Filmgarde", cinemaName: "Leisure Park Kallang"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Bishan"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "City Square"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Grand, Great World City"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Jurong Point"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "JCube"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Lido"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Lot One"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Tampines"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Tiong Bahru"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Vivocity"),
             showtime(exhibitorTitle: "Golden Village", cinemaName: "Yishun"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Balestier"),
             showtime(exhibitorTitle: "Shaw", cinemaName: "Century")]

array = array.sort({$0.cinemaName < $1.cinemaName}).sort({$0.exhibitorTitle < $1.exhibitorTitle})

for st in array {
    print("\(st.exhibitorTitle):\(st.cinemaName)")
}






















