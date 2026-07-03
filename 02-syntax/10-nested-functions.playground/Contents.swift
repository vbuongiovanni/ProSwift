import UIKit

// Nested functions are implemented as named closures in swift, meaning they capture values from their enclosing function.

struct Point {
    var x: Double
    var y: Double
}

enum DistanceTechnique {
    case euclidean
    case euclideanSquared
    case manhattan
}


// calculate distance, by taking in both the coordinates and a technique:
func calculateDistance(start: Point, end: Point, technique: DistanceTechnique) -> Double {
    func euclidianSquared(start: Point, end: Point) -> Double {
        let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        return deltaX * deltaX + deltaY * deltaY
    }
    
    func euclidian(start: Point, end: Point) -> Double {
        let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        return sqrt(euclidianSquared(start: start, end: end))
    }
    
    func manhattan(start: Point, end: Point) -> Double {
        abs(start.x - end.x) + abs(start.y - end.y)
    }
    
    return switch technique {
    case .euclidean: euclidian(start: start, end: end)
    case .euclideanSquared: euclidianSquared(start: start, end: end)
    case .manhattan: manhattan(start: start, end: end)
    }
}


// factory function - Simply returning the algorithm as a closure.

func createDistanceAlorgithm(technique: DistanceTechnique) -> (Point, Point) -> Double {
    func euclidianSquared(start: Point, end: Point) -> Double {
        let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        return deltaX * deltaX + deltaY * deltaY
    }
    
    func euclidian(start: Point, end: Point) -> Double {
        let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        return sqrt(euclidianSquared(start: start, end: end))
    }
    
    func manhattan(start: Point, end: Point) -> Double {
        abs(start.x - end.x) + abs(start.y - end.y)
    }
    return switch technique {
    case .euclidean: euclidian
    case .euclideanSquared: euclidianSquared
    case .manhattan: manhattan
    }
}

let algorithm = createDistanceAlorgithm(technique: .euclidean)

print("calculateDistance: \(calculateDistance(start: Point(x: 0, y: 0), end: Point(x: 5, y: 5), technique: .euclidean))")
// Note that since this is a closure, it does not have named parameters
print("Algorithm: \(algorithm(Point(x: 0, y: 0), Point(x: 5, y: 5)))")
