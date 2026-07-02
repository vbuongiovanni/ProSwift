
var greeting = "Hello, playground"

let numbers = [1, 2, 3]

// This is an expression, hence no return keyword is needed.
let doubles = numbers.map {$0 * 2}

// Likewise, this same logic can be applied to functions. They can return an expression,
// meaning no explicit return is needed:
func double (_ number: Int) -> Int {
    // this is an expression, not a statement:
    number * 2
}

// In Swift 5.9 and onwards, if and switch statements received this same functionality,
// Allowing if and switch statements after assignment:

func get10Or20() -> Int {
    // Example of if statement w/ only expressions that produces an int:
    if Bool.random() {
        10
    } else {
        20
    }
    // Note that this ONLY works because the body of the if statement are expressions.
    // as soon as it's a statement, this no longer works:
    //    if Bool.random() {
    //        let sum = 10
    //        return sum
    //    } else {
    //        20
    //    }
}

// This same logic can be used with enums - demo'd here using a switch statement
enum Weather {
    case rainy, snowy, sunny, windy
}

func getItem(for weather: Weather) -> String {
    switch weather {
    case .rainy: "Umbrella"
    case .snowy: "Sweater"
    case .sunny: "Sunscreen"
    case .windy: "Jacket"
    }
}

// Because of this, we can also use if and switches during assignemnt:
let scoreType = "three"

let score = switch scoreType {
case "two": 2
case "three": 3
default: 0
}

let passedTest = if score > 2 {
    true
} else {
    false
}

// Distinction between returning if statement and terinary operators
let customerRating = 3
// When you use terinary operator, swift considers both values together when typechecking
// Here, 1 is coherced to 1.0
let bonus1 = customerRating > 3 ? 1.5 : 1
// When you use if-statement, swift considers each value independently, meaning they must explicitly match.
// Otherwise, swift will complain.
let bonus2 = if customerRating > 3 {1.5} else {1.0}


