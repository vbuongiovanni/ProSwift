import UIKit

// Errors must be handled somewhere, but they do NOT need to be in the immediate caller of a throwing func or method:

enum PasswordError: Error {
    case empty
    case short
}

func functionA() {
    // Error is handled in functionA because of error propagation:
    do {
        try functionB()
    } catch {
        print("Some error")
    }
}

func functionB() throws {
    // Potential error from functionC does NOT cause any issues, becuase functionB simply throws the error..
    // Because of that, the handling of the error is not required.
    // In principal, this is for the same reason that functionC doesn't have to handle it's own error. It can simply bubble up.
    // This is allowed as long as all error enum cases are handled somewhere.
    try functionC()
}

func functionC() throws {
    throw PasswordError.short
}

// With that, consider the following:


func functionX() throws {
    do {
        try functionC()
    } catch PasswordError.empty {
        print("FunctionX found an empty error")
    }
    // No catch-all here, so this function can sill throw an error
}

// functionZ is NOT marked as throws, because it catches all other errors. It is, in essence, the terminus for the throwing cycle.
func functionZ() {
    do {
        try functionX()
    } catch {
        print("Some other error type")
    }
}
