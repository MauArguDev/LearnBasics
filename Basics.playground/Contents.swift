import UIKit
import Foundation

//Variables

var str = "Hello"
let str2 = "Bye"

str
str2

str = "New String"

var num : Double = 1.0

print(num)

print("En el string my number: \(num)")

var b : Int?
b = nil

print(b ?? 0)

if let c = b {
    print(c)
}

b = 2

print(b ?? 0)

if let c = b {
    print(c)
}

//Tuples

let coor = (2.5 , 3.8)
coor.0
coor.1

let (x,y) = coor

x
y

let (x1, x2) = (2.5, 3.8)

x1
x2

var copia = coor

copia.0 = 8.5

copia
coor

//Arrays

var numbers = [1, 2, 3]
var anyArray : [Any] = [true, "text", 8]
var emtyArray : [Any] = []

numbers += [4, 5, 6, 7]

numbers.append(8)

numbers[0]
numbers[4]

numbers.map{ nums in
    return nums * 2
}

numbers.map{$0 * 2}

let nums = numbers.reduce(0) { (result, element ) in
    return result + element
}

numbers.reduce(0){ $0 + $1 }

//Dictionaries

var user : [String:Any] = [
    "name":"Mauro",
    "lastName": "Argumedo",
    "age": 21,
    
]

user["name"]

user["work"] = "Developer"

user["age"] = 22

user.removeValue(forKey: "work")

for (key, value) in user {
    print("for key \(key) the value is: \(value)")
}

//Condition statements
var a = 20
if a > 10 {
    print("Do something")
}

let senior = a > 10 ? "senior" : "junior"

//Loops

for i in 1...5{
    print(i)
}

for i in 1...5 where i % 2 == 0 {
    print(i)
}

print("------------------------")

for i in numbers.indices {
    print(i)
}
print("------------------------")

for i in numbers {
    print(i)
}

for _ in 1 ... 2 {
    print("Hi")
}

var age = 10

while age > 0 {
    age -= 1
}

repeat {
    age += 1
} while  age < 5

age = 20

switch age {
case 1:
    print("1")
case 2:
    print("2")
case 10 ... 100 where age % 10 == 0:
    print("10 to 100")
default:
    print("Not in range")
}

//Functions
b = nil

func myVoid(){
    guard let _ = b else {
        print(0)
        return
    }
    print("My function")
}

myVoid()

func myInt() -> Int {
    return 4
}

print(myInt())

func myParams(n1: Int, n2: Int) -> Int{
    return n1 + n2
}

print(myParams(n1: 25, n2: 25))

func myNoLabel(_ n1: Int, _ n2: Int) -> Int{
    return n1 + n2
}

print(myNoLabel(10, 20))

func sendEmail(to address : String) -> String {
    return("Email sended to \(address)")
}

print(sendEmail(to: "Mauro66Arg@gmail.com"))

func optional (_ n1 : Int?, _ n2 : Int?, _ n3: Int = 5) -> Int{
    guard let n1 = n1, let n2 = n2 else {
        return 0
    }
    return n1 + n2 + n3
}

print(optional(10, 10))
print(optional(nil, nil))
print(optional(nil, 10))
print(optional(10, 10, 10))

func multipleParams(numbers: Int..., other: Int) -> Int{
    var total = 0
    for i in numbers {
        total += i
    }
    total += other
    return total
}

print(multipleParams(numbers: 1 , 2, 3, 4, other: 5))

//TypeAlias

//Plantillas para poder pasar multiples funciones como parametro de otra funcion
typealias mathOperation = (Int, Int) -> Int

func sum(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func rest(n1: Int, n2: Int) -> Int {
    return n1 - n2
}

func math(operation : mathOperation, a : Int, b: Int) -> Int {
    return(operation(a, b))
}

print(math(operation: sum, a: 10, b: 15))
print(math(operation: rest, a: 100, b: 99))

func reference(_ a : inout Int){
    a += 10
}

var n = 10
reference(&n)
n

//Classes and structs

protocol Callable{
    func callPerson()
}

class SuperPerson {
    
}


//Solo puede heredar de una clase el resto son protocolos (interfaces)
class personClass : SuperPerson, Callable{
    func callPerson() {
        print(name)
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

//Struct no puede heredar
struct personStruct : Callable{
    func callPerson() {
        print(name)
    }
    
    var name: String
}

//Las clases pasan valores entre ellas por lo que si una cambia todas cambian
let pa = personClass(name: "Mauro Class")

//Los structs pasan referencia por lo que cada uno posee una copia independiente
let pb = personStruct(name: "Mauro Struct")

pa.name
pb.name

let pc = pa
var pd = pb

pc.name
pd.name

pc.name = "Otro nombre"
pd.name = "Otro nombre"

pa.name
pb.name
pc.name
pd.name

pa.callPerson()
pb.callPerson()


