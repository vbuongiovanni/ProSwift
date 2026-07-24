import UIKit

// Typed throws allow you specify which errors are being throw. This provides three benfits:
// 1: Swift will ensure we only ever throw the specified errors.
// 2: we no linger need a catch-all if all other cases of error are handled.
// 3: when we catch the error, the compiler will already know the types.

// WHile this sounds great, the guidance from the docs is:
// "even with the addition of typed throws to Swift, untyped throws are better for most scenarios."
// This is because they are realistic in how people have to do rework by adding stuff later on down the road if their minds change.

enum UserError: Error {
    case badUsername
    case badPassword
}

func auth(username: String, password: String) throws (UserError) -> String {
    if (username == "test") {
        if password != "test-password" {
            throw UserError.badPassword
        } else {
            return "success!"
        }
    } else {
        throw UserError.badUsername
    }
}

do {
    let result = try auth(username: "Test", password: "test-password")
} catch .badUsername {
    print("Bad username")
} catch .badPassword {
    print("Bad password")
}

// Concluding thoughtss:

// 1) Functions that don't throw erros are equivalent to throws(Never)
// 2) Functions that throw untyped errors are equivalent to throws(any Error)
// 3) Using rethrows can be expressed using a generic type parameter, e.g., E, along with a typed throws throws(E)
