import UIKit

// Adding a new operator:


// To add an operator, you need to / should provide Swift with the require info, including
// Init with the type of prefix (infix, prefix, postfix), precedence (good to do), and the implementation:

// Implement a operator to raise a number to the power to another:

// 0.) add a precedence good to do, but not inheritently required
precedencegroup ExponentiationPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: right
}

// 1.) init with a infix type:
infix operator ** : ExponentiationPrecedence

// 2.) Add implementation

func **(lhs: Double, rhs: Double) -> Double {
    pow(lhs, rhs)
}

print(10 ** 2)

// Complex modificiation of existing operators:

// Change the rand operator to accept a third bound, thereby allowing ranges from N to N + 1 to N - 1:

// let range = 1...10...1

// Practically speaking, we are actually going to overload the ... operator to accept
// ...(lhs: CountableClosedRange<Int>, rhs: Int) -> [Int]

func ... (lhs: CountableClosedRange<Int>, rhs: Int) -> [Int] {
    let downwards = (rhs..<lhs.upperBound).reversed()
    return Array(lhs) + downwards
}

precedencegroup RangeFormationPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator ... : RangeFormationPrecedence

let range = 1...5...1
print(range)
