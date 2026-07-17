import UIKit

// Just like classes and actors, closures are reference types. Consider the following:

// Create a function that returns an incrementer closure:
func createIncrementer() -> () -> Void {
    // init counter var
    var counter = 0
    
    // return actual incrementer closure:
    return {
        counter += 1
        print(counter)
    }
}

let incrementer = createIncrementer()

incrementer() // 1
incrementer() // 2
incrementer() // 3

// This functions as expected... each time the closure is called, counter is incremented and printed.
// However, bc this is a reference type, a copy of the incrementer has access to the same counter var
let incrementerCopy = incrementer

incrementerCopy() // 4
incrementerCopy() // 5
incrementerCopy() // 6
incrementer() // 7

// In essence, this is a lesson being careful with using closures with captured values, in this case
// the counter var.
