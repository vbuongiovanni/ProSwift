import UIKit

// the @autoclosure attribute is similar to @escaping that is applied to paramters for a function.
// When used, it automatically creates a closure from an expression that is passed in - when called, the function using this attribute
// the expression is converted to a closure on the fly.. Note that the general guidance is that using this will make code hard to understand.

// example:

func printTest(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}

func printTestWithAutoClosure(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}


printTest() { print("hello") }
printTestWithAutoClosure(print("hello"))

// This probably seems trivial, but it has a few place where it makes sense - assert:
// assert checks if a condition is true and, if not, halts execution

assert
assert(1 == 1, "Math failure!")
assert(1 == 2, "Math failure!")

// Importantly, @autoclosures are also used for the && and the || operators:

func && (lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool {
    return lhs ? try rhs() : false
}
// this is a short-circuit operation: if lhs is false, then the func will just return false out of the gate.

// as well as the try/catch, throws and rethrows keywords. It's used under the hood in a lot of places.
// Practically speaking, it's more for low-level swift.
