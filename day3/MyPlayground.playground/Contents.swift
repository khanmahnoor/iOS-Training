// CLOSURES

// closure expression syntax

let numbers = [10,5,16,29,8475,6,3,1,7,84,753,3256]

//method1 mention everything (Void ki jagah we can use (), also indicating k void he hai

let printnumbers1 : ([Int]) ->Void = {(nums:[Int]) ->Void in for n in nums {print(n)}}
printnumbers1(numbers)

//method2 inferring type from context

let printnumbers2 : ([Int]) -> Void = {nums in for n in nums {print(n)}}
printnumbers2(numbers)

//method3 short hand arguments

let printnumbers3 : ([Int]) -> Void = {for n in $0 {print(n)}}
printnumbers3(numbers)

//using sorted method

//method1

let sortednumbers1 = numbers.sorted(by: {(_ n1:Int, _ n2:Int) -> Bool in return n1 < n2})
print(sortednumbers1)

//method2 infering type from context

let sortednumbers2 = numbers.sorted(by: {n1,n2 in return n1 < n2})
print(sortednumbers2)

//method3 one liner, so we can remove return keyword

let sortednumbers3 = numbers.sorted(by: {n1,n2 in n1 < n2})
print(sortednumbers3)

//method4 shorthand arguments , also a trailing closure

var sortednumbers4 = numbers.sorted(by: {$0 < $1})
print(sortednumbers4)

//method5 operator

var sortednumbers5 = numbers.sorted(by: <)
print(sortednumbers5)

//trailing closures

func doSomething(number:Int, onSuccess closure:(Int)->Void) {
    closure(number * number * number)
}
doSomething(number: 3, onSuccess:{(n) in print (n)}) // called without trailing
doSomething(number: 3) { (n) in print(n) } // called with trailing

// map function (act as trailing)

let divby10 = numbers.map { number -> Int in
    let n = number
    return n/10
}
print(divby10)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let inc10:()->Int = makeIncrementer(forIncrement: 2)
(inc10())
(inc10())
(inc10())
(inc10())

let inc7:()->Int = makeIncrementer(forIncrement: 3)
(inc7())
(inc7())
(inc7())
(inc7())

inc10()

//escaping closures
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
instance.doSomething()
print(instance.x)

completionHandlers[1]()
print(instance.x)

instance.doSomething()
print(instance.x)


//autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer:  customersInLine.remove(at: 0) )

//ENUMERATION

enum CompassPoint : String {
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.west
directionToHead = .east

print(directionToHead)


directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
default:
    print("Where the skies are blue")
}

enum Planet: CaseIterable {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

print(Planet.allCases.count)

for planet in Planet.allCases {
    print(planet)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var x = Barcode.upc(1, 2, 3, 4)
print(x)
var y = Barcode.qrCode("1234")
print(y)

enum ASCIIControlCharacter: Int {
    case one = 1
    case two = 2
    case three = 3
}

print(ASCIIControlCharacter.one.rawValue)

print(CompassPoint.east.rawValue)

enum attachstring {
    case string(String)
    indirect case attach(attachstring,attachstring)
}

let s = attachstring.string("mahnoor says")
let s1 = attachstring.string("hello")
let s2 = attachstring.string("world")
let s3 = attachstring.attach(s1, s2)
let s4 = attachstring.attach(s, s3)


func cl (_ a:attachstring) -> String {
    switch a {
    case let .string(value):
        return value
    case let .attach(left, right):
        return cl(left) + " " + cl(right)
    }
}

print(cl(s4))

