import UIKit

// Example: An app that fetches user data from a remote server (a throwing function) and from a local db (non-throwing function):

enum Failure: Error {
    case badNetwork(message: String)
    case broken
}

func fetchRemote() throws -> String {
    throw Failure.badNetwork(message: "Something went wrong with the connection")
}

func fetchLocal() -> String {
    "Me"
}

// To pass this function in as a parameter, it needs to be of type () -> String AND () throws -> String
// So how is this done??


// A thought to remember from Swift Reference Guide:
// "nonthrowing functions are subtypes of throwing functions. As a result, you can use a nonthrowing function in the same places as a throwing one."

func fetchUserData(using closure: () throws -> String) {
    do {
        let result = try closure()
        print("Signed in with: \(result)")
    } catch Failure.badNetwork(let message) {
        print("error!! \(message)")
    } catch {
        print("something went south")
    }
}

// Given that non-functions are accepted in place of throwing functions, both of our functions are accepted.
// In essence, when we type a function paramter as throws, it only means that it CAN throw an error... not that it must

fetchUserData(using: fetchRemote) // error!! Something went wrong with the connection
fetchUserData(using: fetchLocal) // Signed in with: Me


// This works fine for this situation, but swift has something better: rethrows

func betterFetchUserData(using closure: () throws -> String) rethrows {
    let result = try closure()
    print("Signed in with: \(result)")
}

// With rethrows in place, swift checks each call of the fetchUsertData individually, then only requires the error handling if the internal
// closure actually requires error handling where it's needed

do {
    try betterFetchUserData(using: fetchRemote)
} catch Failure.badNetwork(let message) {
    print("error!! \(message)")  // error!! Something went wrong with the connection
} catch {
    print("something went south")
}
betterFetchUserData(using: fetchLocal) // Signed in with: Me


// basically, rethrows you get the best of both worlds - flexibility in what the function accepts, but typesafety in what the compiler will flag.
// This allows you to clean the placement of try/catch code to where it's actually applicable.
