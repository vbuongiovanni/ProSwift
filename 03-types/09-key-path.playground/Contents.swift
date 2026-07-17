import SwiftUI

// Key paths are uninvoked references to properties, meaning they prefer to a property itself rather than the value of the property.

let aString = "SomeTextHere"

// Value:
print(aString) // SomeTextHere
// Key Path
print(\String.count)  // \String.<computed 0x00000001025986cc (Int)>

// More practically speaking, we can create some string:
let name1 = "Benia"
let name2 = "Marcus"

// Then refernce the key path of the count method:
let countPath = \String.count

// THen, it can be used.
print("\(name1)[keyPath: countPath]: ", name1[keyPath: countPath]) // 5
print("\(name2)[keyPath: countPath]: ", name2[keyPath: countPath]) // 6

// Note that key paths can also refernce other properties, like isEmpty, isASCII, etc

// Key Paths can be useful when combined with @dynamicMemberLookup to attribute power to generic subscripts. Consider this:


struct User {
    var name: String
    var job: String
    var city: String
    var age: Int
}

class ViewModel {
    var user: User
    
    init(user: User) {
        self.user = user
    }
}

let bob = User(name: "Bob", job: "Cashier", city: "LA", age: 33)
let viewModel = ViewModel(user: bob)

// Now, in order to access the user, we need to do something like this:
print(viewModel.user.name) // Bob
print(viewModel.user.job) // Cashier
print(viewModel.user.age) // Cashier

// This is where @dynamicMemberLookup can help:

@dynamicMemberLookup
class BetterViewModel {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    // This defines a new subscript in the form of className.someValue
    // Note that this needs to be a generic in order to translate what the return type
    // will be (e.g., whatever the property's type is).
    subscript<T>(dynamicMember keyPath: KeyPath<User, T>) -> T {
        user[keyPath: keyPath]
    }
}

let betterViewModel = BetterViewModel(user: bob)
print(betterViewModel.name) // Bob
print(betterViewModel.job) // Cashier
print(betterViewModel.age) // Cashier

