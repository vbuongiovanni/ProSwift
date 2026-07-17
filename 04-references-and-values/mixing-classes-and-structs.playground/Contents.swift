import UIKit

// Boxing - Wrapping a value type inside a reference type so it can be shared more easily.
// This technique is commonly seens in C# & Java:


struct Person {
    var name: String
    var age: Int
    var favoriteIceCream: String
}

let bob = Person(name: "Bob", age: 33, favoriteIceCream: "Vanilla")

// If we want to share the bob struct, we could create a PersonBox class.
// This is a reference type that will be shared rather than copied:

final class PersonBox {
    var person: Person
    init(person: Person) {
        self.person = person
    }
}

let box = PersonBox(person: bob)

// to simulate other parts of the app, let's create a TestContainer
final class TestContainer {
    var box: PersonBox!
}

let container1 = TestContainer()
let container2 = TestContainer()

// Now, we have two TestContainers, each of each contain the same box reference, which points to the same
// person struct
container1.box = box
container2.box = box

print(container1.box.person.name) // Bob
print(container2.box.person.name) // Bob

box.person.name = "Pete"

print(container1.box.person.name) // Pete
print(container2.box.person.name) // Pete

// This technique can be helpful, as it explicitly shows that you intend to share something.

// Performance Implications:

// Additionally, Swift uses Automatic Reference Counting (ARC), which keeps track of how many times an
// object is referenced. When the count reaches 0, it is destroyed.

// Structs are NOT reference counted because they are uniquely reference.
// However, if a struct contains a class object, THAT object is reference counted. So if your struct
// has many objects as properties, then the ARC has to do N reference increments and decrements each time the struct is compied.

// In this situation, boxing the struct in a wrapper object simplifies things dramatically, because
// ARC would only need to manipulate the reference count for the box, not for all the individual
// properties.

// Practical Example - Units in the doorcast App, if units had many class objects for properties

class SomeClass {
    
}

class UnitBox {
    var someClass1: SomeClass
    var someClass2: SomeClass
    // ...
    var someClass20: SomeClass
    
    init(someClass1: SomeClass, someClass2: SomeClass, someClass20: SomeClass) {
        self.someClass1 = someClass1
        self.someClass2 = someClass2
        self.someClass20 = someClass20
    }
}

struct Unit {
    var box: UnitBox
}

// assuming 2600 units, this would translate to 52,000 ARC operations per copy.
