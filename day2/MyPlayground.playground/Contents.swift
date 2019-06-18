// ASSERTS

let age = -9
//assert(age >= 0, "A person's age can't be less than zero.")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

// BASIC OPERATORS

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let contentHeight = 40
let hasHeader = false
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "red"
var userDefinedColorName: String?  = "green"  // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[0...] {
    print(name)
}

let rangee = ...5

// STRING AND CHARACTERS

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

print(quotation)

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}"

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

print(threeDoubleQuotationMarks)

let threeMoreDoubleQuotationMarks = #"Line 1\nLine 2"#
print(threeMoreDoubleQuotationMarks)

print("6 times 7 is \(6 * 7).")

let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]

// COLLECTION TYPES

var threeXs = Array(repeating:"x", count: 3)

var shoppingList = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList)
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)
let mapleSyrup = shoppingList.remove(at: 0)
print(mapleSyrup)

var myset = Set<Int>()
myset.insert(4)
myset.insert(2)
myset.insert(3)
print(myset)
//myset.remove(3)
for m in myset.sorted() {
    print(m)
}
print(myset)

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

var dict = [Int:String]()
dict[1] = "hello"
dict[2] = "world"
dict[3] = "!"
print(dict)

for (x,y) in dict {
    print(x,y,"i")
}

// CONTROL FLOW

let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark)
}

//snakes and ladders

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare)
print(board)
board[02] = +08; board[05] = +11; board[08] = +09; board[09] = +02
board[13] = -10; board[18] = -11; board[21] = -02; board[23] = -08


print(board)

var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    print("diceroll",diceRoll)
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
    print("square",square)
    if square < board.count {
        square += board[square-1]
        print("square",square)
    }
}
print("Game over!")

let someCharacter: Character = "B"
switch someCharacter {
case "a","B":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let approximateCount = 4
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

let somePoint = (9, 0)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

let numberSymbol: Character = "1"//三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
    fallthrough
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
    fallthrough
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
    fallthrough
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
    fallthrough
default:
    print("lol")
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


// FUNCTIONS

func add(num1:Int,num2:Int) -> Int {
    return num1 + num2
}

add(num1: 4,num2: 7)
add(num1: 2,num2: 5)

func multiply() -> Int {
    return 2 * 4
}

multiply()

func add2(num1:Int,num2:Int) -> (Int,Int) {
    return (num1 + num2, num1 * num2)
}

var x = add2(num1: 4,num2: 7)
print(x.0,x.1)


//SWIFT 5 problem
//func add3 ( num1 : Int, num2 : Int) -> String {
//    "hello"
//}

add3(num1: 3, num2: 4)

func add4(_ num1:Int,_ num2:Int) -> Int {
    return num1 + num2
}

add4(4,7)

func add5(_ num1:Int,_ num2:Int = 3) -> Int {
    return num1 + num2
}

add5(4)

func extadd(_ numbers:Int...) -> Int {
    var total: Int = 0
    for number in numbers {
        total += number
    }
    return total
}

extadd(1,2,3,4,5,6)

func newadd(_ num1:inout Int,_ num2:inout Int) -> Int {
    num1 = num1 + num2
    return num1
}

var n1 = 1
var n2 = 2
newadd(&n1, &n2)

func add6(_ num1:Int,_ num2:Int) -> Int {
    return num1 + num2
}
var myadd : (Int,Int) -> Int = add6

myadd(4,6)

func add7 (_ num1:Int,_ num2:Int) -> Int {
    return num1 + num2
}

func myfunc(_ addi : (Int,Int) -> Int ,_ x:Int, _ y:Int) {
    print(addi(x,y))
}
myfunc(add7,5,6)

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(_ backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = -3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}


func math(_ type:Bool) -> (Int,Int) -> Int{
    func add (_ num1:Int,_ num2:Int) -> Int {
    return num1 + num2
}
    func mult (_ num1:Int,_ num2:Int) -> Int {
        return num1 * num2
}
    return type ? add : mult
}

var check = math(5<0)

print(check(1,2))
