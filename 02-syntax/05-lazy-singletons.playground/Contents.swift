import UIKit

// Demo of using a lazy singleton - a MusicPlayer
// The example here is that you would never want the MusicPlayer to work with multiple artists, otherwise songs
// would overlap.


class MusicPlayer {
    init() {
        print("Ready to play songs!")
    }
}

@MainActor
class Artist {
    // All static let properies are, by default, lazy in swift.
    static let musicPlayer = MusicPlayer()
    
    init() {
        print("Creating a new singer")
    }
}


// Thus, if we instantiate a new Artist, we will NOT see "Ready to play songs!"
let vince = Artist()
// Unless we explicitly call 'musicPlayer'
Artist.musicPlayer
