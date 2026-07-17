import UIKit

struct ResortStruct {
    var name: String
}

// This is allowed BC the struct is a variable
var brighton = ResortStruct(name: "Brighton")
brighton.name = "Sundance"
print(brighton.name)

// This is NOT allowed BC struct is a constant:
let deerValley = ResortStruct(name: "Deer Valley")
// ERROR: Cannot assign to property: 'deerValley' is a 'let' constant
//deerValley.name = "Park City"
//print(deerValley.name)

final class ResortClass {
    var name: String
    let hasShittyTraffic: Bool
    init(name: String, hasShittyTraffic: Bool = false) {
        self.name = name
        self.hasShittyTraffic = hasShittyTraffic
    }
}

// This is allowed, even though it is a constant, BC it's a class.
// While you can't change it's value (e.g., it's refence), you CAN change it's values,
// so long as those values are variables and not constants.
let snowBird = ResortClass(name: "Snowbird", hasShittyTraffic: true)

// This is okay, BC name is a variabe.
snowBird.name = "Alta"
print(snowBird.name)

// This is NOT okay, BC it's a constant.
// ERROR: Cannot assign to property: 'hasShittyTraffic' is a 'let' constant
//snowBird.hasShittyTraffic = false

// Here's a breakdown:

// variable struct: CAN change property and value
// constant struct: CANNOT change property or value

// variable object: CAN change property AND reference
// constant object: CAN change property okay, but CANNOT change reference


// Note: Wherever possible from a business logic standpoint, mark structs as constants
// rather than variables. Reason is two-fold: 1) it makes code safer and 2) allows swift to add optimizations
