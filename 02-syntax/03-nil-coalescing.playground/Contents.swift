import UIKit

var greeting = "Hello, playground"

// Nil coalescing is synonomous with TS's null coalescing:

let optionalName: String? = "vince"
print(optionalName) // Optional("vince")
let unwrappedName = optionalName ?? "Anon"
print(unwrappedName) // Vince

// This can be combined with try?

// Say we have an app that reads in a text file that user previously worked on, if it exists.
// However, the file may not exist for one or more reasons. This would require something like this:

let savedText: String

do {
    savedText = try String(contentsOfFile: "saved.txt" ,encoding: .utf8)
} catch {
    print ("Failed to load saved text")
    savedText = "Hello, World! Let's get started!"
}

print(savedText)

// While this works, it's verbose. it can be made more concise by using the try? keyword:

let conciseSavedText: String

conciseSavedText = (try? String(contentsOfFile: "saved.txt", encoding: .utf8)) ?? "Hello, World! Let's get started!"
print(conciseSavedText)

// This is a good place to remember that try can be called in three ways:
// // try: tries to run code, if it encounters an error, the error will be thrown.
// // try!: try to run code, if it fails it crashes the app.
// // try?: try to run the code, if it fails, it returns nil.
