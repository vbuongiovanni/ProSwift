import UIKit

var cities = [
    "Shanghai": 24_356_800,
    "Karachi": 23_500_000,
    "Beinjing": 21_516_000,
    "Soul": 9_995_000
]


// When working with dicts, use mapValues instead of map. It transforms values and puts them
// back into a dict with the same keys:
let roundedCities = cities.mapValues{ "\($0 / 1_000_000) million people"}

print(roundedCities)
//["Karachi": "23 million people", "Beinjing": "21 million people", "Soul": "9 million people", "Shanghai": "24 million people"]

// Dictionary Grouping - Used to group dictionary keys:

let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }

print(groupedCities)
// [Optional("S"): ["Soul", "Shanghai"], Optional("B"): ["Beinjing"], Optional("K"): ["Karachi"]]

// Finally, reading values from the dict can be access as shown below. Since it's optional, you can
// handle this value any which way
let soulPop = cities["Soul"] ?? 0
let karachiPop = cities["Karachi", default: 0]

print(soulPop)
print(karachiPop)

// However, when writing values, you must specify a default in
cities["Soul", default: soulPop] = 10_000_000

let favoriteTVShows = ["Falling Skies", "Ozark", "Ozark", "Friends"]
var counts = [String: Int]()

for show in favoriteTVShows {
    counts[show, default: 0] += 1
}

print(counts)
