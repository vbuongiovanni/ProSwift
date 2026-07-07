import UIKit

// Raw Strings - these are useful when you have quotes or escaped characters?

let message1 = #"Can you imagine trying to make "this" via ""normal"" string? "#

print(message1) // Can you imagine trying to make "this" via ""normal"" string?


// A better comparison - with escapes
let message2Bad = "In order to escape \"\\\", you need to write \"\\\\\""
print(message2Bad)
let message2Good = #"In order to escape "\", you need to write "\\"#
print(message2Bad)


// Notes on performance and memory usuage

// A Note on isEmpty vs count methods

let string = "Some String"

print("string.isEmpty: ", string.isEmpty, " - Ideal & efficient. Works by comparing indices at 0 and -1")
print("string.count == 0: ", string.count == 0, " - inefficient - works by counting EVERY character.")

// Strings Vs Substrings:

// Similar to ArraySlice, Swift will still store the entire string when substring
// is used.

func generateBigString() -> Substring {
    let input = String(repeating: UUID().uuidString, count: 100_000)
    // input is going to be massive in terms of memory.. obviously.
    let endPosition = input.index(input.startIndex, offsetBy: 100)
    // But, we will return a substring.
    return input[...endPosition]
}


func runTest() {
    // However, because of the way Swift handles substrings, this substrings
    // is still going to be massive, even though it is just a segment of the original string.
    let substring = generateBigString()
    print(substring)
}

func runTestWithStringCoercsion() {
    // Instead, if we coherce the output to a real string,
    // then swift will release the memory:
    let coercedString = String(generateBigString())
    print(coercedString)
}

print("Starting")
//runTest()
print("Done!")
