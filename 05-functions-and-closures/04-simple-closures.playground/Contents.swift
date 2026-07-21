import UIKit

// What is a closure in swift??
// // It's a block of code that can be passed around and stored like a variable.
// // It also has the ability to capture any values that it uses.


var greeting = {
    var numGreetings = 0
    numGreetings += 1
    print("Hello! \(numGreetings)")
}

greeting() // 1

// Closures can be copied:
var greetingCopy = greeting

greetingCopy() // 2
// note that they are reference types though:
greeting() // 3


// of course, functions can take a closure:

func randomlyGreet(_ closure: () -> Void) {
    if Bool.random() {
        closure()
    }
}

randomlyGreet(greeting)
randomlyGreet(greeting)
randomlyGreet(greeting)
randomlyGreet(greeting)

// More practically
func delay(by seconds: Double, closure: () -> Void) async throws {
    try await Task.sleep(for: .seconds(seconds))
    closure()
}

//try await delay(by: 1, closure: greeting)
//
//// or...
//try await delay(by: 1) {
//    greeting()
//}


// This is how to add params to closures:

let greetPerson = {(name: String) in
    print("Hello, \(name)")
}

greetPerson("Bob")


// To create a function that takes a closure that takes a function, this is the syntax

func delayGreetPerson (by seconds: Double, _ closure : (String) -> Void, with name: String) async throws {
    try await Task.sleep(for: .seconds(seconds))
    closure(name)
}

try await delayGreetPerson(by: 1, greetPerson, with: "Pete")
