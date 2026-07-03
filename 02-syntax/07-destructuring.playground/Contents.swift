import UIKit

var greeting = "Hello, playground"

// Destructuring, or decomposition, has three uses:
// 1. Pulling a tuple apart into multiple values
let data = ("one", "two", "three")
let (one, two, three) = data
print(one)

// note that this is commonly used with functions that return a tuple:

func getPerson() -> ( String, String ) {
    (name: "Vince", hairType: "bald")
}
let (name, hairType) = getPerson()

print("\(name) is \(hairType)")

// note that values can also be ignored via _

let (_, altHairType) = getPerson()
print(altHairType)

// 2. Using this same logic, you can assign multiple things at once:

let (title, age, (myName, myHairType)) = ("Software engineer", "20s", getPerson())

// 3. Likewise, you can also resassign variables using this destructuring/
// Per Paul, this is rarely useful but good to know, mostly for interviews.

var a = 10
var b = 20

(b, a) = (a, b)

