import Cocoa

let name: String? = "Vince"
let password: String? = "P@ssword"

// Optionals can be asssedd using .some and .none

switch (name, password) {
case (_, .none): print("username and password are required")
case (.none, _): print("username and password are required")
default:
    switch (name, password) {
    case ("Vince", "P@ssword"): print("Welcome vince!")
    case ("Vince", _): print("Wrong password")
    default: print("Not authorized")
    }
}

// This can simplified using the optional syntax

switch (name, password) {
case(nil, password?): print("username and password are required")
case(name?, nil): print("username and password are required")
default:
    switch (name, password) {
    case ("Vince", "P@ssword"): print("Welcome vince!")
    case ("Vince", _): print("Wrong password")
    default: print("Not authorized")
    }
}

// This same logic can be applied to for-case
// In this case, all items will be printed, except for nil.

let randomData: [Any?] = ["Vince", nil, 122, "<>", "Test"]

for case let item? in randomData {
    print(item)
}

for case let .some(item) in randomData {
    print(item)
}
