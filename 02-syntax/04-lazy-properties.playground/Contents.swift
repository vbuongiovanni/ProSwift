import UIKit

var greeting = "Hello, playground"
print(greeting)

// Consider this - we have some computationally expensive processing we want to perform on a class.
// Option 1 - add a method (func reverseName): This works well if we only need to run the method on rare offchance cases. If it was more common, we'd be running the same process over and over again, which is inefficeint
// Option 2 - add another property (let reversedName): This works if we ALWAYS need the value.. otherwise, we will be reversing the name for no reason.
// Option 3 - Lazy Properties: This is a middle ground, where the properies are only calcualted, and stored, once.. and ONLY if they are used. Thus, we get the best of both worlds.

class Person {
    let name: String
    let reversedName: String
    
    init(name: String) {
        self.name = name
        // Option 2: another property
        self.reversedName = String("\(name.reversed())")
    }
    
    // Option 3: Lazy Property
    // // Note that you often need to explictly declare the type and add () after the closure, because we are calling it right away.
    lazy var lazyReversedName: String = {
        String("\(name.reversed())")
    }()
    
    // Option 1: Method
    func reverseName() -> String {
        String("\(name.reversed())")
    }
}


let me = Person(name: "Vince")

// Option 1: The code in the method will be every time the method is called.
print(me.reverseName())
// Option 2: The code in the init function will be run for every instantiation of the Person class.
print(me.reversedName)
// Option 3: The code in the closure will ONLY be ran when this closure is called.
print(me.lazyReversedName)


// A common compliant about lazy vars is that they end up cluttering the class. This can be mitigated by using a specific private class to encapsulate the logic
class Animal {
    let type: String
    init(type: String) {
        self.type = type
    }
    
    lazy var dogName = self.getDogName()
    
    private func getDogName() -> String {
        if type == "Dog" {
            "MD"
        } else {
            ""
        }
    }
}
