import UIKit

var greeting = "Hello, playground"

// Demoing the power and flexibility of the where caluse

let numbers = [0, 1, 2, 3, 4, 5, 6]

for number in numbers where number.isMultiple(of: 2) {
    print(number)
}

// Similar methods can be used on other types
let peeps = [
    "Michael Jackson",
    "Michael Jordan",
    "Ted Bundy",
    "Michael Myers",
]

for person in peeps where person.starts(with: "Michael") && !person.contains("Myers") {
    print("\(person) won't murder you")
}

// you can use a for case let to handle optionals, alongside a where to focus on filtering

let optionalPeeps: [String?] = [
    nil,
    "Michael Jackson",
    "Michael Jordan",
    "Ted Bundy",
    "Michael Myers",
    nil,
]

for case let person? in optionalPeeps where person.starts(with: "Michael") && !person.contains("Myers") {
    print("\(person) won't murder you")
}
