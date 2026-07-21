import UIKit

// Despite the fact functions, methods, operators, and closures can be blurry, Swift
// seemlessly handles them in highly coherent ways.
// Example:



func hasMatch (input: String) -> Bool {
    let resorts = ["Brighton", "Snowbird", "Snow Basin", "Solitude"]
    // we can use input.contains, where String.contains("someString")
    // directly as the closure in where because they use the same call signatures
    return resorts.contains(where: input.contains)
}


// The same idea can be shown with reduce
let numbers = [1, 2, 3, 56, 234, 3]

let verboseNumbers = numbers.reduce(0) { (int1, int2) -> Int in
    int1 + int2
}

// in simpler form, leveraging functional programming, we can use reduce like this:
let sum = numbers.reduce(0, +)

print(verboseNumbers)
print(sum)
