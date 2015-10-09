
import UIKit
import Foundation

class Item {
    var quantity:Int {
        willSet {
            if quantity != newValue {
                dirty = true
            }
        }
    }
    
    var dirty = false
    var name:String
    init(quantity:Int, name:String) {
        self.quantity = quantity
        self.name = name
    }
}

var item1 = Item(quantity: 7, name: "Phillipe")
var item2 = Item(quantity: 4, name: "Knutze")
var item3 = Item(quantity: 28, name: "Granduel")

item3.quantity = 42

var items = [Item]()
items.append(item1)
items.append(item2)
items.append(item3)
items.append(item3)

var reducedSum = items.map({ $0.quantity as Int }).reduce(0, combine: +)
reducedSum

var sum = items.reduce(0) { $0 + $1.quantity } as Int
sum

var avg = sum / items.count
avg

var count = items.count
count

var max = items.reduce(items[0], combine: { ($0.quantity > $1.quantity) ? $0 : $1 })
max

var min = items.reduce(items[0], combine: { ($0.quantity < $1.quantity) ? $0 : $1 })
min

var items2 = [Item]()
items2.append(item1)
items2.append(item2)
items2.append(item3)
items2.append(item3)

var all = [items, items2].flatMap { $0 }.map { $0.quantity }

all

var distinct = all.reduce(Set<Int>(), combine: { (set, current) -> Set<Int> in
    var tmp = set
    tmp.insert(current)
    return tmp
})

distinct


let initialArray = [1, 4, 2, 2, 6, 24, 15, 2, 60, 15, 6]

// Sum
var sum2 = initialArray.reduce(
    0, combine: { (accumulator, current) -> Int in
        return accumulator + current
}) // 137

// Average
let avg2 = sum2 / initialArray.count // 12

// Max
let max2 = initialArray.reduce(initialArray.first!, combine: { (last, current) -> Int in
    return last > current ? last : current
}) // 60

// Min
let min2 = initialArray.reduce(initialArray.first!, combine: { (last, current) -> Int in
    return last < current ? last : current
}) // 1

// UnionOfObjects
let notFlat = [[1, 4, 2, 2, 6, 24], [15, 2, 60, 15, 6]] // An array of arrays of integers

var flat = notFlat.flatMap({ $0 }) // [1, 4, 2, 2, 6, 24, 15, 2, 60, 15, 6]

// DistinctUnionOfObjects
var distinctUnionOObjects = flat.reduce(Set<Int>(), combine: { (last, current) -> Set<Int> in
    var tmp = last
    tmp.insert(current)
    return tmp
}) // {2, 4, 60, 6, 15, 24, 1}

// Or simpler
var distinctUnionOfObjects = Set(flat) // {2, 4, 60, 6, 15, 24, 1}
var distinctAsArray = Array(distinctUnionOfObjects) // [2, 4, 60, 6, 15, 24, 1]



//var allObjects = (items as NSArray).valueForKeyPath("@sum.quantity") as! NSNumber
//var quantity = (items! as NSArray).valueForKeyPath("@sum.quantity") as? NSNumber

//allObjects.integerValue


//let gtFour = items.filter { (item) -> Bool in
//    return $0.quantity > 4
//}


//gtFour
//
//let gtSeven = items.filter( { $0.quantity > 7 } )
//gtSeven

let A: (Int, String) = (1234, "Bob")

A

var myString:NSString = "testing"
//var result = reduce(Array(myString), "", { $0! + ($1 == "\\" ? "" : $1) } )


var dict = items.reduce([String:Item]()) { thing, element in
    var d = thing
    d[element.name] = element
    return d
}

dict

var dicts = items.reduce([String:Item](), combine: { (dictionary, currentElement) -> [String:Item] in
    var tmp = dictionary
    tmp[currentElement.name] = currentElement
    return tmp
})

dicts

