import Cocoa

enum WeatherType {
    // Enum with an associated value
    case cloudy(coverage: Int)
    case sunny
    case windy
}

var today = WeatherType.cloudy(coverage: 90)

switch today {
    // assoicated value can be unpacked like this:
case .cloudy(let coverage):
    print("It is \(coverage)% cloudy")
case .windy:
    print("It is windy!")
case .sunny:
    print("It is sunny!")
}

// Taking it a step further, the associated value can unpacked and used:
switch today {
case .cloudy(let coverage) where coverage < 100:
    print("It is \(coverage)% cloudy - maybe it'll clear up!")
case .cloudy(let coverage) where coverage >= 100:
    print("It is cloudy and there is no hope for sun!")
case .windy:
    print("It's windy")
case .sunny:
    print("its sunny!")
default:
    print("It's definitely cloudy!")
}

// Finally, this can be tied in with ranges
switch today {
case .cloudy(let coverage) where coverage <= 0:
    print("Its not cloudy.. so infact, it's sunny!")
case .cloudy(let coverage) where (1...50).contains(coverage):
    print("It's a little cloudy")
case .cloudy(let coverage) where (51...100).contains(coverage):
    print("It's really cloudy")
case .cloudy(let coverage):
    print("It's cloudy")
case .windy:
    print("It's windy")
case .sunny:
    print("its sunny!")
}


// In for case loops, you can use enums with associated values as such:
let forcast: [WeatherType] = [
    .cloudy(coverage: 100),
    .cloudy(coverage: 75),
    .cloudy(coverage: 45),
    .cloudy(coverage: 25),
    .windy,
    .sunny
]

// This will print out the coverage for all cloudy days with the coverage
// windy and sunny days will be omitted
for case let .cloudy(coverage) in forcast {
    print("coverage: \(coverage)")
}
