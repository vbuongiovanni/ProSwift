import UIKit
import Foundation


// Sets vs Array - performance
// Sets are stored by hash rather than by incrementing integer index value, and they are unodered, making them much more efficient

// Searching an array has a complexity of O(n), meaning its dependent on size of array.
// Searching a set has a complexity of O(1), because only needs one pass since sets are deduped.


var set1 = Set<Int>([1, 2, 3, 4, 5])
// Note that sets are unordered
print(set1) // [2, 3, 4, 1, 5]

// Adding elements:
set1.insert(6)
set1.insert(7)
print(set1)


// Even though sets are unordered, they still have access to the .sorted() method:
for num in set1.sorted() {
    print(num)
}

// checking if something exists

if set1.contains(7) {
    print("Number 7 was present!")
}

// and removing an item
set1.remove(7)

if set1.contains(7) {
    print("Number 7 was present!")
} else {
    print("Number 7 was no longer present...")
}

// Sets and Array work the same way:
let set2: Set = [1, 2, 3, 4]
let array1 = Array(set2)
let set3 = Set(set2)

// That said, this is a clean and efficeint way to dedupe:
let uniqueSet = Array(Set([1, 2, 3, 4, 4, 4, 5, 56, ]))
print(uniqueSet)

// Sets DO have removeLast, popFirst, removeFirst, and popFirst (oddly, arrays don't have this one)
// However, since sets are unordered, they may be less useful.

// Sets also have additional methods that arrays do not:

var skiResorts = Set(["Brighton", "Canyons", "Deer Vally", "Park City"])
let cities = Set(["Brighton", "Salt Lake City", "Price", "Park City"])

// Combines two sets
let union = skiResorts.union(cities)
// Returns items that are shared
let intersection = skiResorts.intersection(cities)
// Returns items that are NOT shared.
let symmetricDifference = skiResorts.symmetricDifference(cities)

print("union:", union)
print("intersection:", intersection)
print("symmetricDifference:", symmetricDifference)

// Note: These three methods have form<MethodName> which modifies the set in place.

// There is also isSubset and isStrictSubset, which checks setA against setB.
// a subset will pass if all items in B exist in A.
// a strict subset will pass if all items in A exist in B, and B has other items. E.g., it excludes identical sets.

let spaceships1 = Set(["Serenity", "Nostromo", "Enterprise"])
let spaceships2 = Set(["Voyager", "Serenity", "Executor"])
let spaceships3 = Set(["Galactica", "Sulaco", "Minbari"])
let spaceships1and2 = spaceships1.union(spaceships2)
print("""
---
spaceships1: \(spaceships1)
spaceships2: \(spaceships2)
spaceships3: \(spaceships3)
spaceships1and2: \(spaceships1and2)
---
""")
print("spaceships1.isSubset(of: spaceships1and2) :", spaceships1.isSubset(of: spaceships1and2)) // true
print("spaceships1.isSubset(of: spaceships1) :", spaceships1.isSubset(of: spaceships1)) // true
print("spaceships1.isSubset(of: spaceships2) :", spaceships1.isSubset(of: spaceships2)) // false
print("spaceships1.isStrictSubset(of: spaceships1and2) :", spaceships1.isStrictSubset(of: spaceships1and2)) // true
print("spaceships1.isStrictSubset(of: spaceships1) :", spaceships1.isStrictSubset(of: spaceships1)) // false

// NSCountedSet: Similar to a normal set, except that it keeps track of how many times an item should have been added
// This provides a lot of the performance gains of sets to specific use cases, like tracking counts.

var votedSkiResorts: [String] = ["Brighton", "Canyons", "Deer Vally", "Park City"]
votedSkiResorts += ["Canyons", "Deer Vally", "Park City"]
votedSkiResorts += ["Canyons", "Deer Vally", "Park City"]
votedSkiResorts += ["Park City"]

let countedSet = NSCountedSet(array: votedSkiResorts)

print(#"countedSet.count(for: "Brighton"):"#, countedSet.count(for: "Brighton"))
print(#"countedSet.count(for: "Canyons"):"#, countedSet.count(for: "Canyons"))
