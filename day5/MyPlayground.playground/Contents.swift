//TYPE METHODS

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
print(player.tracker.currentLevel)
player.complete(level: 2)
print(player.tracker.currentLevel)

var player2 = Player(name: "Beto")
print(LevelTracker.highestUnlockedLevel)
print(player2.tracker.currentLevel)

print("\n")

player2.complete(level: 1)
player2.complete(level: 2)
player2.complete(level: 3)

print(player.tracker.currentLevel)
print(player2.tracker.currentLevel)

print(LevelTracker.highestUnlockedLevel)

if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}



//SUBSCRIPTS

class mystr {
    var x : Int = 0
    subscript (index : Int) -> (String,Int) {
        return ("\(index)",x/index)
    }
}

var s = mystr()
s.x = 8
print(s[2])


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var x = Matrix(rows: 3, columns: 3)

print(x.grid)

x[2,2] = 4

print(x[2,2])

print(x.grid)

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

//INHERITANCE

class Animal {
    var name = ""
    var info : String {
        return "This Animal's name is \(name)."
    }
    func sound() {

    }
}

var cat = Animal()
cat.name = "Cupcake"

var dog = Animal()
dog.name = "Max"

print(cat.info)
print(dog.info)

//superclassing

class Cat : Animal {
    var greet = "Hello"
    override func sound() {
        print("Meow")
    }
}

class Dog : Animal {
    var temp = 0
    override func sound() {
        print("Woof")
    }
}

var c = Cat()
c.name = "cuppy"
print(c.info, "Its a Cat, It greets with \(c.greet)")

var d = Dog()
d.name = "Max"
d.sound()

//INITIALIZATION

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"
