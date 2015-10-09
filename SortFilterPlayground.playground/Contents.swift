
import UIKit

let items = ["Veggies" : ["Cucumbers", "Carrots", "Celery", "Romain"],
    "Fruits" : ["Apples", "Bananas", "Cherries", "Pomagranate"]]


var veggies = items["Veggies"]

// Typecasting to NSArray
var filteredOldWay = (veggies! as NSArray).filteredArrayUsingPredicate(
                                NSPredicate(format:"self BEGINSWITH[c] %@", "c"))



// Anonymous parameters
var filtered = veggies?.filter( { $0.lowercaseString.hasPrefix("c") } )


// Named parameters
let filtered2 = veggies?.filter { (string) -> Bool in
    return string.lowercaseString.hasPrefix("c")
}

// Old way, (more typecasting)
var sortedOldWay = (veggies! as NSArray).sortedArrayUsingDescriptors(
    [NSSortDescriptor(key: "self", ascending: false)])


// Shorthand
var sorted = veggies?.sort(>)

// Explicit
var sorted2 = veggies?.sort({ (str1, str2) -> Bool in
    return str1 > str2
})




//func itemsForName(name:String) -> [String]? {
//    return items[name]
//}
//
//
//let veggies = itemsForName("Veggies")
//if veggies != nil { // Explicitly check for nil
//    // Do something with items
//    let first = veggies![0]
//}
//
//
//
//if let fruits = itemsForName("Fruits") {
//    // Only get here if we were able to unwrap the return type
//    let first = fruits[0]
//}





