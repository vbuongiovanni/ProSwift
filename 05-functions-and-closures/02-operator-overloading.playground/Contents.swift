import UIKit

// Operators are the symbols used to check or transform values, like +, -, *, ==, =+
// Operator overloading allows you to give clear, natural, and expressive code

// Downside of operator overloading
// 1) they CAN be unclear. EX: horse1 + horse2 = ???? Baby horse? Faster Horse? a race between two horses?
// 2) Often, they can accomplished with just methods for better clarity - horse1.race(against: horse2)
// 3) It hides complexity : Perhaps horse1 + horse2 requires a lot of computation under the hood
// 4) Biggest issue - it can produce unexpected results.

// Basics - Operator Overloading is done using functions:

// Example - custom comparison function:

struct Horse {
    var stallNumber: Int
    var name: String
    
    // Note: Name of function is literally "==="
    // == is an infix operator, and lhs and rhs are known as 'operands'
    // Function MUST return a Bool
    static func ===(lhs: Horse, rhs: Horse) -> Bool {
        lhs.name == rhs.name && lhs.stallNumber == rhs.stallNumber
    }
    
    static func ==(lhs: Horse, rhs: Horse) -> Bool {
        lhs.name == rhs.name && lhs.stallNumber != rhs.stallNumber
    }
}

let first = Horse(stallNumber: 1, name: "Seabiscut")
let second = Horse(stallNumber: 2, name: "Seabiscut")

if first === second {
    print("Same Horse")
} else {
    print("Diff horse")
}

if first == second {
    print("Horses have same name")
}

// Swift orders the underlying functionality of an operator based on 1) Precedence and 2) Associativity.

// // When there are multiple operators without brackets, swift starts by looking at Precedence. This is the same as PEDMAS.

// Precendence can be controller - this is observed here https://github.com/swiftlang/swift:
// where a precendence group is defined:
//precedencegroup AdditionPrecedence {
//    associativity: left
//    higherThan: RangeFormationPrecedence
//}
//precedencegroup MultiplicationPrecedence {
//    associativity: left
//    higherThan: AdditionPrecedence
//}

// then used:
//infix operator * : MultiplicationPrecedence
//infix operator + : AdditionPrecedence
//infix operator - : AdditionPrecedence

// Again, these are known as 'infix', rather than prefix, because they reside between two operands:
// 5 + 5
//   ^
// infix


// < 5
// ^
// prefix


// If there is still a conflict, associativity is used - 'does this operator work on things to it's left or it's right.
// Consider the following:
// Noting that the - operator has an associativity of 'left' by default
let leftAssociativity = 10 - 5 - 1

// To fully demo this, add a modified minus operator with right-associativity:
// First, let's defined the precence group:
precedencegroup AdditionPrecedence {
    associativity: right
    higherThan: RangeFormationPrecedence
}

// init the operator - at a minimum, you must specifiy either infix, prefix, or postfix.
infix operator --: AdditionPrecedence

// then add an implementation:
func --(lhs: Int, rhs: Int) -> Int {
    return lhs - rhs
}

let rightAssociativity = 10 -- 5 -- 1

print("leftAssociativity: (10 - 5) - 1 = ", leftAssociativity)
print("rightAssociativity: 10 - (5 - 1) = ", rightAssociativity)


// Adding to an existing operator:
// let's modify the existing * operator to multiple adjacent matrix elements:
func *<T : Numeric>(lhs: [T], rhs: [T]) -> [T] {
    let limit = min(lhs.count, rhs.count)
    var result = [T]()
    
    for i in 0..<limit {
        result.append(lhs[i] * rhs[i])
    }
    
    return result
}

let prodMatrix = [1, 2, 3] * [4, 5, 6 , 7]
print(prodMatrix) // [4, 10, 18]
