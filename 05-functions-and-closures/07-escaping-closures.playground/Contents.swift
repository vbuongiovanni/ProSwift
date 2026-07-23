import SwiftUI

// By default, when you pass a closure into a function,
// Swift will consider it non-escaping by default -
// This means that it must be used immediately in the function and cannot be stored away for alter.

// Conversly, escaping closures are those that will be called after the method has returned - these are
// most often used when the closure needs to be called asynchronously.

// Example - a delay function that calls a closure after N number of seconds

// Note that this only works because we mark the func as async. However, we must use await everytime it's called

// In order to call a closure inside a task,it must be marked as 'escaping'
// Thus, telling swift that will NOT be called right away.
func delay(_ seconds: Int, closure: @escaping () -> Void) throws {
    Task {
        try await Task.sleep(for: .seconds(seconds))
        closure()
    }
}

let someClosure = {
    print("Hello")
}

try delay(10, closure: someClosure)

// Why does it matter???
// The distinction matters - since closures are reference types, swift needs to know
// whether or not the closure will be used after the function is finished because of reference counting

// As a result, non-escaping closures are fractionally more efficient.
