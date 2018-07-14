//: Playground - noun: a place where people can play

import UIKit

var movies = ["movie 11111", "movie 22222", "movie 33333", "movie 44444", "movie 55555", "movie 66666", "movie 77777", "movie 88888"]

var weights = [1.1, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]

var percentages = [Double]()
var total:Double = 0.0

for num in weights {
    total += num
}

for weight in weights {
    var thePercentage = weight/Double(total)
    percentages.append(thePercentage)
}

print(total)
print(percentages)

func generatedWeightedList (movies: [String], weights: [Double]) -> [String] {
    var weightedList = [String]()
    
    for (index, weight) in weights.enumerate() {
        let multiples = weight * 100.0
//        print(multiples)
//        print(Int(multiples))
//        print(Int(ceil(multiples)))
        
        for var jndex = 0; jndex < Int(multiples); jndex++ {
            weightedList.append(movies[index])
        }
    }
    
    return weightedList
}
func getRandomMovie(WeightedMovies: [String]) -> String {
    let randIndex = Int(arc4random_uniform(UInt32(WeightedMovies.count)))
    
    return weightedMovies[randIndex]
}



var weightedMovies = [String]()

weightedMovies = generatedWeightedList(movies, weights: percentages)


func getMultipleResults (numberOfResults: Int, theArray: [String]) -> [String:Int] {
    var resultsDict = [String:Int]()
    
    for _ in 1...numberOfResults {
        let chosenMovie = getRandomMovie(theArray)
        if resultsDict[chosenMovie] == nil {
            resultsDict[chosenMovie] = 1
        } else {
            resultsDict.updateValue(resultsDict[chosenMovie]!+1, forKey: chosenMovie)
        }
    }
    
    return resultsDict
}
func getWinningResults (result: [String:Int]) -> (String,Int) {
    var finalKey: String!
    var finalValue: Int!
    for (key, value) in result {
        if finalValue == nil {
            finalValue = value
            finalKey = key
        } else {
            if finalValue < value {
                finalValue = value
                finalKey = key
            }
        }
    }
    return (finalKey, finalValue)
}

for _ in 1...10 {
    let myResultsDict = getMultipleResults(1000, theArray: weightedMovies)
    print(myResultsDict)
    let (movieTitle, totalWin) = getWinningResults(myResultsDict)
    print("--- \(movieTitle) won \(totalWin) times! \n")
}

//for _ in 1...100 {
//    print(getRandomMovie(weightedMovies))
//}










