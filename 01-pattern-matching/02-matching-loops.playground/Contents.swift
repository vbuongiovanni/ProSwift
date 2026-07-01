import Cocoa

var greeting = "Hello, playground"

let me = (name: "vince", password: "p@ssword")
let pete = (name: "pete", password: "PeteyBoyeee")

let users = [me, pete]

// loop over each user
for user in users {
    print(user.name)
}

// for case can be used to only loop over certain users
// This filters users based on name, then destructure's password as a local variable:
for case let ("vince", password) in users {
    print("Shhh, vince's password is \(password)")
}

