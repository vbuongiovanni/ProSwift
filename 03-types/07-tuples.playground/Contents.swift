import UIKit

// tuples are basically just anonomous structs
// Functions that return void, under the hood, return an empty tuple:
func doNothing() {}
let result = doNothing()
print(result) // ()

// Likewise, every type in swift is effectively a single element tuple of itself:
let int1: (Int) = 1
let int2: Int = (1)
let int3: Int = (1)

print(int1) // 1
print(int2) // 1
print(int3) // 1
print("int3 == int2: ", int3 == int2)

// Tuples are everywhere, however, they cannot implement methods or protocols.

// Swift makes Tuples are strongly typed - example:
var singer = ("Ozzy", "Osbourne")
// we cant add a new field here - this would throw an error:
// singer = ("Ozzy", "Osbourne", 100) // Cannot assign value of type '(String, String, Int)' to type '(String, String)'

print(singer.0) // Ozzy

// You can also create nested tuples - which is where naming comes in handy
var person = (occupation: "Rockstar", name: singer)
print(person.name.1)
// Once names are added, they become part of the type.


// While you can't add methods, you CAN add closures to tuples.
// This is because adding a tuple is just like adding any other value - you are attaching code as data.
var artist = (first: "Roger", last: "Waters", sing: {(lyrics: String) in
    print(lyrics)
})

artist.sing("Shine on, you crazy diamond")

// Tuples are commonly used to return multiple elements from a function:
func fetchWeather() -> (type: String, cloudCoverage: Int) {
    (type: "Sunny", cloudCoverage: 0)
}
let weather = fetchWeather()
print(weather) // (type: "Sunny", cloudCoverage: 0)
let (weatherType, coverage) = weather
print("Today, the skies are \(weatherType) with a cloud coverage of \(coverage)")


// Tuples can have optional items, or optional nested tuples.

// Tuples can be compared against, so long as they have 6 or less items:

let singer2 = (first: "Taylor", last: "Swift")
let person2 = (first: "Justin", last: "Bieber")
if singer2 == person2 {
    print("Match!")
} else {
    print("No match")
}

// However, using this is illadvised, because Swift compares only against types, NOT labels.
let bird = (name: "Taylor", breed: "Swift")
if singer2 == bird {
    print("singer2 == bird: Match!")
} else {
    print("No match")
}

// Tuples can also be typealiased. For example, instead of this:

//func marryPeople(man: (first: String, last: String),woman: (first: String, last: String)) -> (husband: (first:
//String, last: String), wife: (first: String, last: String)) {
//(man, (woman.first, man.last))
//}

// we can use a typealias:
typealias Name = (first: String, last: String)

// and rewrite the function as shown:
func marryTaylorsParents(man: Name, woman: Name) -> (husband: Name, wife: Name) {
    (man, (woman.first, man.last))
}

// using tuples with typ alias provide a good middle ground between using a full on struct vs no typing at all.
