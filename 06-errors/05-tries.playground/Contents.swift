import UIKit

// Three ways to try:

// 1: try - Must have a catch block
// // Most common, generally best one to use because it's type safe and you catch all errors
// // Good for most cases.

// 2: try? - returns nil if any errors thrown. This will make the return type optional
// // Safe and useful fallback, but adverse impact of potentially swallowing your error and make return type optional
// // try? is good for situations where you don't really care what the return value is, you just want to attempt to do something.

// 3: try! - your app will explode if an error is thrown.
// // Unsafe - risks crashing the app. very uncommon
// // Only potential usecase is a situation where a file that is bundled in the app and, if it doesn't exist,
// // then the app SHOULD crash. However, I would argue thats a better use for fatalError() rather than making
// // the entire app explode


// try? in action:

// unwrapping:

if let savedText = try? String(contentsOfFile: "saved.txt", encoding: .utf8) {
    print(savedText)
} else {
    // Error, bc savedText was nil
    print("nothing found")
}

// null coaencsing:
let savedText = try? String(contentsOfFile: "saved.txt", encoding: .utf8)
print(savedText) // nil
let value = savedText ?? "Nothing available"
print(value) // "Nothing available"
