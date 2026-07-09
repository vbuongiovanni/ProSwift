import UIKit

// 3 main types of ranges: Range, ClosedRange, PartialRanges:

// 1. Range: half open range - has upper and lower bounds, excludes upper bound: (0..<18)
// 2. ClosedRange: closed range - has upper and lower bounds, inclusive of upper bound: (0...18)

// 3. Partial ranges: (has upper OR lower bounds). Partial ranges can be further divided into:
//   1. PartialRangeFrom: Lower bound only, inclusive: (0...)
//   2. PartialRangeThrough: Upper bound only, inclusive: (...10)
//   3. PartialRangeUpTo: Upper bound only, exclusive: (..<11)

// There are various types of ranges, but the most common are Range (open range) and ClosedRange

let range = 0..<18  // Inverval from lower bound up to, but not including, an upper bound
let closedRange = 0...17 // Inverval from lower bound up to, and including, an upper bound

print("range - 0..<18 :", range.count)
print("closedRange - 0...17 :", closedRange.count)

// There are also partial ranges, where only one bound is specified:
let partialRangeFrom = 10...
let partialRangeThrough = ...10
let partialRangeUpTo = ..<11

// these will generate ranges relative to Int.max or Int.min, respectively.
// Partial ranges are handy when slicing arrays:
let skiResorts = ["Canyons", "Deer Valley", "Snow Basin", "Brighton", "Snowbird", "Alta"]
let divider = 2
let pcResorts = skiResorts[..<divider]
let otherResorts = skiResorts[divider...]

print("pcResorts", pcResorts)
print("otherResorts", otherResorts)

// This way, you don't have to specify upper bounds of the array.

// Bounds
// Bounds can be tricky because closed ranges and half-open ranges tell you upper and lower bounds,
// but they don't tell you whether they include the final number:

let ages1 = 0..<18
let ages2 = 0...17
print("0..<18:", ages1) // 0..<18: 0..<18
print("0...17:", ages2) // 0...17: 0...17

// Additionally, partial ranges don't have either an upper or lower bound:
let halfOpenRange = 0...
//print("halfOpenRange.upperBound", halfOpenRange.upperBound) // error
print("halfOpenRange.lower", halfOpenRange.lowerBound) // 0

// you COULD use .max(), but this will manually loop over every integrer before arriving at 9 quintillion
// print("halfOpenRange.max()!", halfOpenRange.max()!) // 9,000,000,000,000,000,000

// The relative(to:) method is handy in situations like this, as it creates a new range that is bounded
// on both sides by the bounds of another sequence.

let people = ["Bob", "Pete", "Merry", "Steve", "Dave", "Tom"]
let losers = 4...
let bounded = losers.relative(to: people)

print("bounded.upperBound: ", bounded.upperBound) // 6
print("bounded.lowerBound: ", bounded.lowerBound) // 4

// Ranges are always contiguous, meaning a range of 1...5 will always be 1, 2, 3, 4, 5.
// If you want to specify the sequence, then a RangeSet must be used:

struct TestResult {
    var student: String
    var score: Int
}

let testResults = [
    TestResult(student: "Steve", score: 95),
    TestResult(student: "Marry", score: 70),
    TestResult(student: "Pete", score: 100)
]

// Create RangeSet:
let topResults = testResults.indices { student in
    student.score > 80
}

print(topResults) // [Range(0..<1), Range(2..<3)]

// This can be used as subscript:

for testResult in testResults[topResults] {
    print("\(testResult.student) scored \(testResult.score)%")
}

// Checking for a containing value: this can be accomplished used either the .contains method or pattern match operator
// This can be nice, since the operator doesn't require parentheses around the range like the .contains method does.

print("(1...100).contains(70): ", (1...100).contains(70))
print("1...100 ~= 70: ", 1...100 ~= 70)

// Ranges from Comparable protocol:
let alphabet = "a"..."z"
let prev24Hours = Date.now.addingTimeInterval(-86400)...Date.now

print(alphabet) // a...z
print(prev24Hours) // 2026-07-08 16:22:36 +0000...2026-07-09 16:22:36 +0000

// Thus, you can make a range out of anything, provided that it comforms to the Comparable protocol.
