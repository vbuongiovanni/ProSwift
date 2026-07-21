import UIKit

let resorts = ["Brighton", "Snow bird", "Snow Basin", "Deer Valley", "Sundance", "Solitude"]

let verboseNamingFilter = {(name: String) -> Bool in
    name.contains("Snow")
}

let filtered1 = resorts.filter(verboseNamingFilter)

// or we can minnify it by allowing swift to infer the types and using the $0, $1, ... $n vars
let filtered2 = resorts.filter { $0.contains("Snow") }

// Shorthand naming in closure makes sense when:
// 1. The function is short, maybe 1 - lines.
// 2. It's using one of Swift's built-in methods (filter, map, sort), where the meaning are well known.
