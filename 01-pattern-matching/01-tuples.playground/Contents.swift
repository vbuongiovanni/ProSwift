import Cocoa



// Simple Switch statement via string:
let name = "Vince"
switch name {
    case "Vince": print("It's me")
case "Pete": print("it's pete!")
    default: print("Someone else")
}

// In this same manner, tuples can be used
let auth = (name: "Vince", password: "P@ssword")

switch auth {
    // Full Match
case ("Vince", "P@ssword"): print("Welcome, Vince")
    // Partial Match: Underscore can be used if one or more fields are needed for a match
    // This can also be used for all cases if there's a property in the tuple that is completely irrelevent
case ("Vince", _): print("Wrong password, Vince")
case("Pete", "PeteyBoy"): print("Welcome, Pete")
default: print("Not authorized")
}

// You can also pluck out the value of a specific case using an embedded let. Note that any value of this property will pass.

switch auth {
case ("Vince", let password): print("Welcome, Vince - your password was \(password)")
default: print("Not authorized")
}

// For a more practical example, we can use the tuples with the switch statement for the fizzbuzz test

func fizzbuzz(_ number: Int) -> String {
    let value = (number.isMultiple(of: 3), number.isMultiple(of: 5))
    switch value {
    case (false, false): return String(number)
    case (true, false): return "fizz"
    case (false, true): return "buzz"
    case (true, true): return "fizzbuzz"
    }
}

for i in 1...25 {
    print("\(i): \(fizzbuzz(i))")
}
