var str = "Hello, playground"
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "world"
print("The current value of friendlyWelcome is \(friendlyWelcome)")

let cat = "🐱";
print(cat)

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11

let hexadecimalDouble = 0xC.3p0

let cannotBeNegative: UInt8 = -1 //error

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.max

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

let possibleNumber = "hello world"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
//serverResponseCode = nil

var surveyAnswer: String? = "hello world"

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("hello"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

func canThrowAnError() throws {
    let y = 0
//    var x = 7/y
}

do {
    try canThrowAnError()
    print("division by zero")
} catch {
    // an error was thrown
}
