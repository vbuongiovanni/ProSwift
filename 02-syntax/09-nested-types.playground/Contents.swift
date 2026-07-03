import UIKit

// enums and structs can be nested inside other enums/structs, or classes


// This enum has a constant (coordinates) and two nested enums, but it doesn't have any cases of it's own. It's just a wrapper:
enum Utah {
    static let coordinates = (lat: 10.000001, long: -10.000001)
    
    enum SkiResorts {
        case snowBird, deerVally, brighton, parkCity
    }
    
    enum Cities {
        case saltLakeCity, parkCity, brighton, heber
    }
}
// This provides 3 benefits:
// 1) Logical grouping
// 2) With code completion, quick and easy drill down:
print(Utah.Cities.saltLakeCity)
// 3) Delineation between cities and ski resorts with the same names:
print(Utah.SkiResorts.parkCity)
print(Utah.Cities.parkCity)

print(Utah.SkiResorts.brighton)
print(Utah.Cities.brighton)

// This same logic can be applied to structs:
// Note that access modifiers can be applied, however if a nested type is marked as private,
// all properties must also be marked as private. (e.g., since the Suit enum is private,
// the suit property must also be private:
struct Deck {
    struct Card {
        private enum Suit {
            case hears, diamonds, clubs, spades
        }
        var rank: Int
        private var suit: Suit
        
        func readCard() {
            print("it's a \(rank) of \(suit)")
        }
        
    }
    
    var cards = [Card]()
}

