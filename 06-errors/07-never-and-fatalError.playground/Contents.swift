import UIKit

// Never: a return type that means "This function will never return". Not that this is different from void, which states this will return nothing.
// A Never function will, by definiteiyl, never come back

func logFatalError (_ errorMessage: String) -> Never {
    print("Pretending to do some loggin logic here")
    // Do some crazy logging here to whatever
    // call fatalError to seize any additional work
    fatalError(errorMessage) // Never returns
}


// fatalError() is similar to assert or precondition, except that is will run regardless of the version and optimizations.. there is no turning it off.
// Additionally, fatalError returns Never, to make the intent clear - the show CAN NOT go on if fatalError is run.
// Best example of this - loading in a local file that should be bundled into the release. If it's not there, then the app should shut down.

func fetchAndReadBundledFile(from filename: String) -> String {
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        logFatalError("Unable to location \(filename)")
    }
    
    guard let contents = try? String(contentsOf: url, encoding: .utf8) else {
        fatalError("Unable to load \(filename)")
    }
    
    return contents
}

fetchAndReadBundledFile(from: "Fiction.csv")
