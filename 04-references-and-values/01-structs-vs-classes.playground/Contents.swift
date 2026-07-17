import UIKit

// Classes: Reference Type - Shared across all owners
// Structs: Value Type - Copied rather than shared, always a single owner

// Example - Destination is assigned to the person Struct.
// If we assign a location to a destination instance, then place it in person,
// then REASSIGN the location before placing it in a different person, the value will be the same
class Destination {
    var location: String = ""
}


struct Person {
    var destination: Destination?
}

var bob = Person()
var pete = Person()



var destination = Destination()

destination.location = "Brighton"
bob.destination = destination

destination.location = "Home"
pete.destination = destination


print(bob.destination?.location)
print(pete.destination?.location)

// If Destination is a class, then both bob and pete will print "Home"
// If Destination is a struct, then both bob will print "Brighton" and pete will print "Home."

// Why??
// When you assign a reference type, like a class, you are actually assigning the reference to the data, not the data itself.
// // Furthermore, with that, different entities can edit the same value of a reference.
// When you assign a value type, like a struct, you are assigning the value itself.
// // Conversely, value types can only have one owner, so when you assign a value type in more than once place, each gets its own copy.


// Swift is an aggressively value-oriented languages, meaning most data types are values rather than refence.
// this includes Booleans, integars, strings, tuples, enums, arrays, and dictionaries.

var a = [1, 2, 3]
var b = a
a.append(4)
print("a.count:", a.count)
print("b.count:", b.count)

// This can make comparisons and, code in general, simpler:
var c = Array(1...3)
if b == c { print("arrays b ([1, 2, 3]) and c (Array(1...3)) are Equal") }
