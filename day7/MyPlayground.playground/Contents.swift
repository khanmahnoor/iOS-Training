print("OPTIONAL CHAINING\n")

class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms : Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
    
    convenience init(buildingNumber:String, buildingName:String) {
        self.init()
        self.buildingNumber = buildingNumber
        self.street = street
    }
}

let john = Person()

john.residence = Residence()

//let roomCount = john.residence!.numberOfRooms
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address(buildingNumber: "12", buildingName: "Sarwar Road")
someAddress.street = "I don't know"
john.residence?.address = someAddress
let temp = john.residence?.address?.buildingNumber


if (john.residence) != nil {
    print("Residence is not nill")
    if let y = john.residence?.numberOfRooms {
        if y < 1 {
            john.residence?.rooms.append(Room(name:"Room1"))
            john.residence?.rooms.append(Room(name:"Room2"))
            john.residence?.rooms.append(Room(name:"Room3"))
            john.residence?.rooms.append(Room(name:"Room4"))
        }
    }
    if let n = john.residence?.numberOfRooms {
        for i in 0...n-1 {
            if let x = john.residence?[i].name {
                print(x)
            }
        }
    }
}
else {
    print("Residence is nill")
}

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

//john.residence?[0] = Room(name: "Roomnill")
//if let n = john.residence?.numberOfRooms {
//    for i in 0...n-1 {
//        if let x = john.residence?[i].name {
//            print(x)
//        }
//    }
//}


var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

print(testScores)

testScores["Brian"] = [72, 87, 60]
print(testScores)

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

if let buildingIdentifier = (john.residence?.address?.buildingIdentifier()) {
    print(buildingIdentifier) //how to fix this warning //if let or give a default value
}

print("\nTYPE CASTING\n")

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//print(libra1ry)

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

print("\nNESTED TYPES\n")

struct BlackjackCard {
    
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank: Int {
        case two = 2, three = 3,
        four = 4, five = 5,
        six = 6, seven = 7,
        eight = 8, nine = 9, ten = 10
        
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .three, suit: .spades)
print("theThreeOfSpades: \(theAceOfSpades.description)")

print("\nEXTENSIONS\n")

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneMeters = 1.km
print(oneMeters)
