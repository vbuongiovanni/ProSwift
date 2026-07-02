import UIKit

var count = 0


@MainActor
func fibonacci(of num: Int) -> Int {
    count += 1
    
    var result = num
    if num > 1 {
        result = fibonacci(of: num - 1 ) + fibonacci(of: num - 2)
    }
    return result
}

// In this case, the fibonacci function will be run on EVERY item in the sequence,
// even though we only actually looked at item in pos 19th.
let eagerFibonacciSequence = (0...20).map(fibonacci)
print("Eager: \(eagerFibonacciSequence[19])") // 4181


// In contrast, if we add .lazy to the the sequence, the code is executed on demand as you access items.
// Specifically, the 19th position because that is the only element actually used:
let lazyFibonacciSequence = Array(0...20).lazy.map(fibonacci)
print("Lazy: \(lazyFibonacciSequence[19])") // 4181


// However, note that the lazy sequence does NOT store the alue, so this requires the same computation 2 more times.
print("Lazy: \(lazyFibonacciSequence[19])") // 4181
print("Lazy: \(lazyFibonacciSequence[19])") // 4181

// Where as the none-lazy sequence is stored, so no additional computation would take place.
print("Eager: \(eagerFibonacciSequence[19])") // 4181
print("Eager: \(eagerFibonacciSequence[19])") // 4181

// Summary:
// Eager: pays for all 21 (including the wasteful 20th) once, then free reads.
// Lazy: pays only for what you touch, but pays again every touch.
