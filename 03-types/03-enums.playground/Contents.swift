import UIKit

// As known, multiple cases can be specified in a single line:
enum Color {
    case unknown, red, pink, blue
}

struct Thing {
    let name: String
    let color: Color
}

// Once in a struct, you can shorthand the values of Enums by dropping the name of the enum (e.g, "Thing")
let pinkThing = Thing(name: "Some", color: .pink)
let redThing = Thing(name: "else", color: .red)

// Raw values in Enums

// If not specified, Swift will assign the raw values of enum based on type

enum NumberedColor: Int {
    case unknown, red, pink, blue
}

print(NumberedColor.unknown.rawValue) // 0
print(NumberedColor.blue.rawValue) // 3

// This can be controlled by either specifying each value, or specifying the first value

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
    case unknown
}

print(Planet.mercury.rawValue) // 1
print(Planet.mars.rawValue) // 4

// Now, we can get a enum value using the raw value, however it will be optional
let planet2 = Planet(rawValue: 2)
print(planet2) // Optional(__lldb_expr_249.Planet.venus)

enum Pet: String {
    case cat = "Cat"
    case dog = "Dog"
    case fish = "Fish"
    case nothing = "Sadness"
}

let cat = Pet(rawValue: "Cat") ?? .nothing
print(cat) // cat

let dog = Pet(rawValue: "Dog") ?? .nothing
print(dog) // dog

// Note that, regardless of whether or not the enum has a string raw value
// the printed value will always be a stringifgied version of the enum case.

// Computed properties & methods

// While properties cannot be added to Enums (other than static properties),
// computed properties and methods can be created:

enum SkiResort {
    case snowBird, brighton, cayons, parkCity, deerValley
    
    var description: String {
        switch self {
        case .snowBird: "Hello steeps and powder... annnnd traffic"
        case .brighton: "Night skiing!"
        case .cayons: "No traffic and not as many tourists"
        case .parkCity:  "No Traffic, but oh so many tourists"
        case .deerValley: "Where all the rich snobs go"
        }
    }
    
    func doAvoidInPeakSeason() -> Bool {
        if self != .cayons {
            true
        } else {
            false
        }
    }
}

let parkCity = SkiResort.parkCity
print(parkCity.description) // No Traffic, but oh so many tourists
print(parkCity.doAvoidInPeakSeason()) // true

// Protocols:

// Out of the box, enums in swift conform to Hashable, as long as they don't have an associated value.
// Enums can also conform to CaseIterable, Comparable, and Identifiable:

// CaseIterable - adds 'allCases' array to enum:
enum Weather: CaseIterable {
    case rainy, snowing, sunny, windy
}

for condition in Weather.allCases {
    print(condition)
//    rainy
//    snowing
//    sunny
//    windy
}

// If associated values are included, then allCases must be manually specified

enum WeatherWithAssociatedValues: CaseIterable {
    case rainy, snowing(isHeavy: Bool), sunny, windy
    
    static var allCases: [WeatherWithAssociatedValues] {
        [.rainy, .snowing(isHeavy: false), .snowing(isHeavy: true), .sunny, .windy]
    }
}

// Comparable: automatically generates the < operator to compare different elements.
// This is great for ordinal data. Note that this DOES support associated values,
// but you need to note that the order dictates how the comparable is evaluated.

enum Size: Comparable {
    case tiny, small, medium, large, extraLarge, other(name: String)
}
let small = Size.small
let large = Size.large
let baby = Size.other(name: "baby")

print(small < large) // true
print(large < baby) // true - this is wrong. see note above... you need to be mindful of order.

// Identifiable - Excellent for adding enums to picker values

// If there aren't any associated values, you can simply add Identifiable protocol and add
// a computed property pointing at the self.
enum FixedTipAmount: Identifiable {
    case five, ten, fifeteen, twenty, twentyfive
    
    var id: Self {
        self
    }
}


// If there IS an associated value, then you would need to add Indentifiable & Hashable protocol and add the same computed property. This is because, under the hood, Hashable inherits the Equatable protocol.
// Note that enums come with hashable out of the box, but it is removed when an associated property is added.
enum TipAmount: Hashable, Identifiable {
    case five, ten, fifeteen, twenty, twentyfive, other(amount: Int)
    
    var id: Self {
        self
    }
}
