import Cocoa

let age = 17

// Ranges can also be used in switch statements:
switch age {
case 0..<18:
    print("switch-case: Between 0 and 17")
case 18...70:
    print("Between 18 and 70")
default:
    print("Older than 70")
}

// Likewise, this same logic can be applied to if case statement.
// This will produce the same result as the switch statement above
if case 0..<18 = age {
    print("case 0..<18 = age: Between 0 and 17")
} else if case 18...70 = age {
    print("Between 18 and 70")
} else {
    print("Older than 70")
}

// Or, a syntactically more clear way to do this same thing is to use the
// pattern match operator - ~=. This removes the case keyword and adds the tidle before the equal sign.

if 0..<18 ~= age {
    print("0..<18 ~= age: Between 0 and 17")
} else if 18...70 ~= age {
    print("Between 18 and 70")
} else {
    print("Older than 70")
}

// This is effectively the same as using the contains method from the range struct
if (0..<18).contains(age) {
    print("(0..<18).contains(age): Between 0 and 17")
} else if (18...70).contains(age) {
    print("Between 18 and 70")
} else {
    print("Older than 70")
}


// Of course, this can also be combined with tuple matching for a powerful pattern:
let user = (name: "vince", password: "P@ssword", age: 36)

switch user {
case let (name, _, 0..<18):
    
    print("\(name) - 0..<18")

case let (name, _, 18...70):
    
    print("\(name) - 18...70")

case let (name, _, _):
    
    print("\(name) - older than 70")
}
