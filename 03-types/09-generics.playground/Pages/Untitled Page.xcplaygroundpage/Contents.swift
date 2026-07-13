import UIKit

// Generic Functions:

// Basic Generic function - this works the same way as typescript.
// Adding the ": Numeric" states that it must conform to the numeric protocol.
func square<T : Numeric>(_ value: T) -> T {
    value * value
}

// Note that to declare the type, you must do it like this though
let squareInt: Int = square(10) // 100
let squareDouble: Double = square(10.5) // 110.25
print(square(25)) // 625

// A more complex example:

// Must conform to hashable:
func mostFrequentElement<T: Hashable>(in array: [T]) -> T? {
    // init a dict of T: Int
    var frequencies = [T: Int]()
    
    // iterate over array, adding counts
    for element in array {
        frequencies[element, default: 0] += 1
    }
    
    // get max
    let item = frequencies.max { $0.value < $1.value }
    
    // return key, that may or may not be nil
    return item?.key
}

let mostFrequentSkiResort = mostFrequentElement(in: ["Brighton", "Brighton", "Park City", "Deer Valley", "Snow Basin", "Snow Bird"])

if let mostFrequent = mostFrequentSkiResort {
    print(mostFrequent) // Brighton
}

// Generic Data Type - we can make a generic struct

struct Deque<T> {
    var array = [T]()
    
    mutating func pushBack(_ obj: T) {
        array.append(obj)
    }
    
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
    
    mutating func popBack() -> T?  {
        array.popLast()
    }
    
    mutating func popFront() -> T? {
        if array.isEmpty {
            nil
        } else {
            array.removeFirst()
        }
    }
}


// Do initialize it, we can specify the type like so:
var testDeque = Deque<Int>()

testDeque.pushBack(5)
testDeque.pushFront(2)
testDeque.pushBack(1)
testDeque.popBack()

print(testDeque)

// Working with Cocoa Types
// Cocoa data types, such as NSArray, NSDictionary NSCountSet, have been available since the dawn of time,
// But they are tricky Objective-C's support for generics is both receent and limited.
// Some Cocoa data types, like NSCountSet, are not at all supported, so you lose out on typesafety.
// however, this is a homebrewed way to accomplisht the same thing

// This is like any other counted set, where the items are unique but you stil retain a count of the each item.
// Effectively, all this does is create a wrapper around the NSCountedSet that is specified with a type,
// thereby enabling typesafety.

struct CustomCountedSet<T: Any> {
    let internalSet = NSCountedSet()
    
    mutating func add(_ obj: T) {
        internalSet.add(obj)
    }
    
    mutating func remove(_ obj: T) {
        internalSet.remove(obj)
    }
    
    func count(for obj: T) -> Int {
        internalSet.count(for: obj)
    }
}

var countedSet = CustomCountedSet<String>()
countedSet.add("Hello")
countedSet.add("Hello")
countedSet.add("Hello")
print(countedSet.count(for: "Hello")) // 3


