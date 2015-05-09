
import UIKit

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

var reduced = items.map({ $0.quantity as Int }).reduce(0, combine: +)
reduced

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

//let nums = [1, 6, 3, 9, 4, 6];
//let numMax = nums.reduce(Int.min, { max($0, $1) })

var distinct = NSSet(array: items)
distinct.allObjects


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


var dict = reduce(items, [String:Item]()) { thing, element in
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
