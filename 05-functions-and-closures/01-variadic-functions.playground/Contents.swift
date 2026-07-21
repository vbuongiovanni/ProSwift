import UIKit

// Variadic functions are functions of indefinite arity, meaning that take as many parameters as you send.
// example: print()
print() // <void>
print(1, 2, 3, 4, 5, 6) // 1 2 3 4 5 6

// There can also be multiple paramters of different types, e.g.

print(1, 2, 3, 4, 5, separator: ", ", terminator: "!\n") // 1, 2, 3, 4, 5!

// Creating variadic functions

enum Operation {
    case sum, prod
}

func mathTheseNums(_ numbers: Int..., operation: Operation) -> Int {
    switch operation {
    case .sum:
        numbers.reduce(0, +)
    case .prod:
        numbers.reduce(1, *)
    }
    
}

let sum = mathTheseNums(1, 2, 3, 4, 5, 6, operation: .sum)
let prod = mathTheseNums(1, 2, 3, 4, 5, 6, operation: .prod)
print("sum:", sum)
print("prod:", prod)
