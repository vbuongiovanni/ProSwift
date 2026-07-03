import UIKit

// Just like JSDocs, Swift has inline comment system that will parse formatted comments into markdown
// Note that markdown syntac still applies.
// The full breakdown of the markdown is available in Quick help.
// The brief description of the first line is shown in the pane that pops up with autocomplete.

/**
 Add two numbers (`num1` and `num2`) together
 1. Must use postiive whole integers
    * Sub bullets can be accomplished like this.
 1. Even though these are all "1.", XCode docs will automatically number them.
 # More!
 ## Highlights - using keywords
 - Parameter num1: First number to sum
 - Parameter num2: Second number to sum
 - Precondition: `num1` & `num2` are both positive numbers
 - Returns: the sum of `num1` and `num2` as an Int
 - Throws: MyError.runtimeError, myError.misc
 - Complexity: O(1)
 - Authors: Vince B.
 */
func addNumbers(_ num1: Int, _ num2: Int) throws -> Int {
    guard num1 >= 0 else { throw MyError.runtimeError("Must be positive")}
    guard num2 >= 0 else { throw MyError.runtimeError("Must be positive")}
    return num1 + num2
}


enum MyError: Error {
    case runtimeError(String)
    case misc
}
