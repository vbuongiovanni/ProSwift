import UIKit

// Apple's error system is designed to be highly extensible, assuming you know what you're doing.
// Furthermore, documentation states that, basically, the performance characteristics of throw vs return are comparable, meaning it is performt.


// All errors you want to throw must be an enum that conforms to Error

enum PasswordError : Error {
    case empty
    case short
    // Associated values are okay:
    case obvious(message: String)
}

// As we know, to mark a function or method as being able to throw an error, we add throws before the return type:

func doSomethingCrazy(_ input: String) throws -> String {
    if input.isEmpty {
        throw PasswordError.empty
    }
    
    if Bool.random() {
        throw PasswordError.short
    }
    
    if input == "123" {
        throw PasswordError.obvious(message: input)
    }
    return "something normal!"
}

// Then, to call it, we can do something like this:

do {
    let something = try doSomethingCrazy("123")
    print(something)
    
} catch PasswordError.empty {
    print("Error: empty!!")
} catch PasswordError.short {
    print("Error: Too Short!")
    // Catching an associated value - you must bind the value to a constant
    // You can also bind a where clause into the catch as well:
} catch PasswordError.obvious(let message) where message != "123" {
    print("Error: Password was obvious: \(message)")
} catch PasswordError.obvious(let message) where message == "123" {
    print("Error: You can't be serious... THATS what you want your password to be???")
} catch {
    print("Error: This is the pokemon catch, because it catches them all")
}
