import UIKit

var greeting = "Hello, playground"

// The guard keyword provides 4 key use-cases

// 1. Early returns: Clearly tell yourself, others reading your code, and the compiler when a
// scope should stop invocation early. Added benefit here is clarity of intent +
// type checker to ensure there is a return or error thrown within else block of guard


// 2. Reduced number of indents in body of code - better code cleanliness. Some dev's believe
// that early returns are satan, as they reduce readability. That said, with guard,
// the preconditions can be resolved immediately:

// 3. guard emphasizes the happy-path by removing all other cases from the outset of the func
// invocation.

func giveBiasedAward(to name: String) -> String {
    guard name == "Vince" else {
        return "..."
    }
    
    // Less indents & single return (other than guard)
    // Easy to see happy-path
    return "And the aware goes to... \(name)!"
}

func giveBiasedAwareWithIf(to name: String) -> String {
    // 2. Additional Indents
    if name == "Vince" {
        // 3. Happy Path - Kinda buried
        "And the ware goes to \(name)"
    } else {
        // 3. Sad Path - Kinda buried
        "..."
    }
}

// 4. guard also has an added benefit of unwrapping conditional on the fly. This is a major
// benefit over just using an if statement. With a regular if let, the name variable is only
// unwrapped locally within the body of the if let. But with guard, it's validated throughout the
// rest of the func.

func conditionallyGiveAware(to name: String?) -> String {
    guard let name else {
        return "No body!"
    }
    
    guard name == "Vince" else {
        return "..."
    }
    // now we KNOW name is not nil
    
    return "Congrats, \(name)"
}

// Bonus - Guard lets you exit any scope if the preconditions fail, not just functions and methods.
// You can also exit loops and switch blocks:

for i in 1...100 {
    guard i == 1 else {
        continue
    }
    print(i)
}

// this is synonmous with:

for i in 1...100 where i == 1 {
    print(i)
}

// Likewise - an example with a switch:

let name = (name: "vince", score: 100)
switch name {
case ("vince", let score):
    guard score == 100 else {
        print("Trash!")
         break
    }
    print("nice job")
default:
    print("something else")
}
