import UIKit

// Structs, by default, conform to Equatable, Codable, and Hashable if we ask



struct Person: Codable, Hashable {
    var name: String
    var age: Int
    var greeting: String
}

// Implication of this is that XCode can automatically create the memberwise initializer:

let aPerson = Person(name: "Bob", age: 23, greeting: "Suhhh Kid")

// Adding a custom initializer would overwite the memberwise because swift will assume
// we are doing some important logic inside, but we can make an shortend version using
// an extension

extension Person {
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.greeting = "Suhh Kid, my name is \(name)"
    }
}

let anotherPerson = Person(name: "Pete", age: 33)


// By default, use Struct over class unless you have a legit reason to do so.
