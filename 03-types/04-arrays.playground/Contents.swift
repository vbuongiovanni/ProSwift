import UIKit

// If an array conforms to the Comparable protocol, then the sorted() and sort()
// methods are automatically included added to the array

var names = ["Tom", "Pete", "Bill"]
var ages = [29, 31, 22]

print(names.sorted()) // ["Bill", "Pete", "Tom"]
print(ages.sorted()) // [22, 29, 31]

// If the items in the array do NOT conform to the Comparable protocol, then
// you must add a manual comparison:

names.sort {first, second in
    print("Comparing \(first) and \(second)")
    if first == "Tom" {
        return true
    } else if second == "Tom" {
        return false
    } else {
        return first < second
    }
}

print(names) // ["Bill", "Pete", "Tom"]

// In addition to sort and sorted, comparable also adds min(), max(). The exact same closure can be used
// Note that this algorithm is actually more efficient for min and max BC they don't reuqire every instances to be looked at.

let namesMin = names.min {first, second in
    print("Comparing \(first) and \(second)")
    if first == "Tom" {
        return true
    } else if second == "Tom" {
        return false
    } else {
        return first < second
    }
}

let namesMax = names.max {first, second in
    print("Comparing \(first) and \(second)")
    if first == "Tom" {
        return true
    } else if second == "Tom" {
        return false
    } else {
        return first < second
    }
}

print(namesMin)
print(namesMax)

// Comparable conformance - adding operator overload:

struct Dog: Comparable {
    var breed: String
    var age: Int
    
    // This is the magic - operator overloading of "<"
    static func <(lhs: Dog, rhs: Dog) -> Bool {
        lhs.age < rhs.age
    }
}

let milo = Dog(breed: "mix", age: 4)
let oliver = Dog(breed: "Beagle", age: 3)
let koby = Dog(breed: "Australian shepard", age: 3)

let dogs = [milo, oliver, koby]

print(dogs.sorted())
// [__lldb_expr_1183.Dog(breed: "Beagle", age: 3), __lldb_expr_1183.Dog(breed: "Australian shepard", age: 3), __lldb_expr_1183.Dog(breed: "mix", age: 4)]

// Adding and removing array items:

// Adding items:

var numbers = [1, 2, 3]
numbers += [4, 5, 6]
let allNumbers = numbers + [7, 8, 9]
print(numbers)
print(allNumbers)

// removing items:

// Pop last removes the last item in array and returns it as an optional
let optionalItem = numbers.popLast()
print("numbers.popLast():", optionalItem) // Optional(6)

// Remove last removes the last item in the array and returns it as non-optional.
// Note that if the array is empty, the app will crash.
let item = numbers.removeLast()
print("numbers.removeLast():", item) // 5

// Remove first works the same way:
let firstItem = numbers.removeFirst()
print("numbers.removeFirst():", firstItem) // 1

// Capacity: reserveCapacity sets a MINIMUM capacity to help Swift avoid repeated reallocations as an array grows.
// It's "soft": Swift may allocate MORE than you ask, but won't shrink below current count.
// It's NOT free — BUT only reallocates if the requested capacity exceeds current capacity.
// If the array already has room, the call does nothing.

var someArray: [Int] = []

// Reserve room for at least 5 elements (capacity becomes >= 5).
someArray.reserveCapacity(5)

// Append 5 values: fits in reserved capacity, so NO reallocation here.
someArray += [0, 1, 2, 3, 4]

// Count must grow to 8, exceeding the reserved 5 — reallocation happens HERE.
// (Swift typically grows by doubling, so capacity jumps past 8, e.g. to ~10.)
someArray += [5, 6, 7]

