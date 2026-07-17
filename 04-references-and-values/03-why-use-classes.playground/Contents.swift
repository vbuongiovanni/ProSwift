import UIKit


// Three reasons to use classes:

// 1. Sharing the same instance by reference:

// Given the nature of reference types, classes have some practical uses.
// Think of database connections or a data model object, which needs to be shared across your app.

// Simple example:

class File {
    var fileName: String
    var contents = ""
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func write(_ text: String) {
        contents += text
    }
    
    func save() {
        print("Writing \(contents) to \(fileName)")
    }
}

// Since this is a class, we could open the file conce, share/add to it from anywhere in our app, then run the save() method.
// This would allow all changes from everywhere to be accounted for.

// 2.) Inheritance
// One feature that classes get that structs do NOT get. This is the ability to build upon a class.

class Pet {
    let type: String
    init(type: String) {
        self.type = type
    }
}

final class Dog : Pet {
    let name: String
    
    init(name: String) {
        self.name = name
        super.init(type: "Dog")
    }
}
let dogglet = Dog(name: "Spot")
print(dogglet.name)
print(dogglet.type)

// 3.)
// Prior Implementations - Many of Apple's older frameworks use classes, including UIKit, SpriteKit, MapKit, Core Location.
// Newer Implementations - @Obserable & SwiftData
// These are all object-oriented.

// Regardless, it's good practice to mark classes as final by default, unless you deliberably want it to be sybclasses.
