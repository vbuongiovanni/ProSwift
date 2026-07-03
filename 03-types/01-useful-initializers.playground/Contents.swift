import UIKit

// repeating values with reapting:count
let heading = "This is a heading that we want the next line to be underlined with"
let underline = String(repeating: "=", count: heading.count)

print(heading)
print(underline)

// This is a heading that we want the next line to be underlined with
// ==================================================================

// Converting to and from numbers:

// Bad:
let stringifiedNumber = "\(100)"
// better:
let stringifiedNumber2 = String(100)

let maybeInt1 = Int("100")
let maybeInt2 = Int("Lol im not an int")

if let int = maybeInt1 {
    print("Converted int value: \(int)")
} else {
    print("maybeInt1 wasn't an int")
}

if let int = maybeInt2 {
    print("Converted int value: \(int)")
} else {
    print("maybeInt2 wasn't an int")
}

// Making array unique via set:

let scores = [5, 4, 1, 23, 1, 4]
let scoreSet = Set(scores)
let uniqueScores = Array(scoreSet)

// Capacities - can be used to help Swift optimize the execution:

var dictionary = Dictionary<String, String>(minimumCapacity: 10)
