import UIKit


// Labels can be used to exit loops or if statements easily.


// Consider a program that creates a 10x10 board and randomly assigns a square an 'X' for treasure:

let size = 10
var board = Array(repeating: Array(repeating: "", count: size), count: size)
board[Int.random(in: 0..<10)][Int.random(in: 0..<10)] = "x"

// We can loop through each square to check for the treasure and flag the X as treasure.
var numChecks = 0
for (rowIndex, cols) in board.enumerated() {
    for (colIndex, col) in cols.enumerated() {
        numChecks += 1
        if col == "x" {
            print("Found x as \(rowIndex) col \(colIndex)")
        }
    }
}

// This works, but it will always require 100 checks
print("Niave required checks: \(numChecks)")

// While you could use a boolean value with breaks to exit early once it's found,
// Swift provides Labels as a better solution:

// Labeled statements lets you name a loop, which then allows you to break or continue based on that name
var numNamedChecks = 0

rowLoop: for (rowIndex, cols) in board.enumerated() {
    for (colIndex, col) in cols.enumerated() {
        numNamedChecks += 1
        if col == "x" {
            print("Found x as \(rowIndex) col \(colIndex)")
            break rowLoop
        }
    }
}
print("Labeled Loop: required checks: \(numNamedChecks)")

// If statement example:
func check1() -> Bool {
    print("running check 1")
    return false
}
func check2() -> Bool {
    print("running check 2")
    return true
}
func check3() -> Bool {
    print("running check 3")
    return true
}
func check4() -> Bool {
    print("running check 4")
    return true
}
func check5() -> Bool {
    print("running check 5")
    return true
}

func runProcess() { print("It worked!") }

// rather than doing something like this:
if check1() {
    if check2() {
        if check3() {
            if check4() {
                if check5() {
                    runProcess()
                }
            }
        }
    }
}

// a labeled statement, with guards, can remove the deeply nested indention and clarify the happy-path.
// This makes for more concise and readable code.
process: if check1() {
    guard check2() else { break process }
    guard check3() else { break process }
    guard check4() else { break process }
    guard check5() else { break process }
    runProcess()
}
