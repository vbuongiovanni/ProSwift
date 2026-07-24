import UIKit

// Assertions - Terminate app, but only does so in release mode

// Assertions are a boolean check that will hault execution immediately if a condition results to false.
// Internally, swift will only run assertions in debug mode

assert(1 == 1) // Simple assertion
assert(1 != 2, "The maths is broken!") // with message

// because assert accepts an autoclosure as the second argument, you can run any other code you like
// before finally returning a string. It's common to use this as a mechanism for logging

func saveError(message: String, file: String = #file, line: Int = #line) -> String {
    // Perform some save logic to local error log file:
    return message
}

//assert(1 == 2, saveError(message: "Fatal Error!")) // with custome closure

// Preconditions - Similar to assertions, but they also run in release mode.

// Takes the same parameters as assert(), but also run in release mode, unless "Disable Safety Checks" is set to true.

// This can/should be used if something has gone fatally wrong that suggests your app is in unstable, unknown, or dangerous state, it's better to just punch out and kill the app.

precondition(1 == 1, "Something Horrible happened... crash everything before data loss.")
