//
//  ViewController.swift
//  SimpleValues
//
//  Created by Lee on 12/17/14.
//  Copyright (c) 2014 My Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Introduction.
        simpleValues();
        functionsAndClosures();
        objectsAndClasses();
        protocolTest();
        generics();
        
        println("-------------------------------------------------------------- The Basics")
        theBasics()
        println("-------------------------------------------------------------- Basic Operators")
        basicOperator()
        println("-------------------------------------------------------------- Collection Types")
        collectionTypes()
        println("-------------------------------------------------------------- Controle Flow and Func")
        controlFlowAndFunc()
        println("-------------------------------------------------------------- Closures And Enumerations And Classes")
        closouresAndEnumerationsAndClasses()
        println("-------------------------------------------------------------- Type Casting")
        typeCastin()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

func simpleValues() {
    println("hello lee");
    
    var aFloat = 0.5; // Variable, can be changed.
    aFloat = 0.5;
    let bFloat = 0.6; // Constant, cand not be changed.
    let cFloat:Float = 0.7; // :can define type if not sure
    
    var arr = ["1", "2", "3"];
    
    let array = [10, 20, 30, 40, 50];
    var totalScore = 0;
    for score in array{
        if (score > 30) {
            totalScore += 3;
        }else{
            totalScore += 1;
        }
    }
    
    var optionalName: String? = "Lee"
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
        println(greeting);
    }
}

func functionsAndClosures() {
    func say(name:String, day:String)->String
    {
        return "name: \(name), day: \(day)";
    }
    
    say("Lee", "Friday");
    println(say("Lee", "Friday"));
}

func objectsAndClasses() {
    var shape = Shape(name: "Lee");
    shape.num = 5;
    shape.perimeter = 6.6;
    println("perimeter: \(shape.perimeter)");
    var shapeResult = shape.simpleDescription();
    println("shape result: \(shapeResult)");
}

class Shape: NSObject {
    var num = 0;
    func simpleDescription()->String{
        return "Shape with \(num)"
    }
    
    var name: String;
    init(name: String) {
        self.name = name;
    }

    var sideLength: Double = 0.0;
    var perimeter: Double {
        get {
            return 3.0 * sideLength;
        }
        set {
            sideLength = newValue / 3.0;
        }
    }
}

func protocolTest() {
    var a = SimpleClass();
    a.adjust();
    let aDescription = a.simpleDescription;
    println("protocol \(aDescription)");
}

protocol ExaProtocol {
    var simpleDescription: String {get};
    mutating func adjust();
}

class SimpleClass: ExaProtocol {
    var simpleDescription: String = "simple class";
    var anotherProperty: Int = 69105;
    func adjust() {
        simpleDescription += "adjusted.";
    }
}

func generics() {
    var a = repeat("repeat", 4);
    println("rep \(a)");
}

func repeat<Item>(item: Item, times: Int) -> [Item] {
    var result = [Item]()
    for i in 0..<times {
        result.append(item)
    }
    return result;
}

func theBasics(){
    //The Basics.
    let minValue = UInt8.min; let maxValue = UInt8.max
    let min = UInt32.min; let max = UInt32.max
    println("min8: \(minValue) max8: \(maxValue) min32: \(min) max32: \(max)")
    
    let httpError = (404, "Not Found")
    let (statusCode, statusMessage) = httpError
    println("The status code is \(statusCode)")
    println("The status message is \(statusMessage)")
    let (justCode, _) = httpError
    println("The code is \(justCode)")
    
    let number = "123"
    let convertNumber = number.toInt()//Maybe failed or success, so it is a optional value.
    let num = "321"
    let convert = String(num);
    println("num: \(convertNumber) str: \(convert)")
    
    let possibleString: String? = "An optional string."
    println(possibleString!) //Need the "!" to get value
    let assumedString: String! = "An implicitly unwrapped optional string."
    println(assumedString)  //No "!"
    if (possibleString != nil) {
        println(assumedString)
    }
    if let definiteString = assumedString {
        println(definiteString)
    }
    
    /*Assertions cause your app to terminate and are not a substitute for designing your code in such a way that invalid conditions are unlikely to arise. Nonetheless, in situations where invalid conditions are possible, an assertion is an effective way to ensure that such conditions are highlighted and noticed during development, before your app is published.*/
    let age = -5
    assert(age <= 0, "Less than 0")
}

func basicOperator(){
    let fontStr = "i love"
    let endStr = " Swift!"
    let resultStr = fontStr + endStr;
    println("\(resultStr)")
}

func collectionTypes(){
    let arr: [String] = ["sn1", "sn2", "sn3"]
    for val in arr{
        println("\(val)")
    }
    for (index, value) in enumerate(arr){
        println("item: \(index) and value: \(value)")
    }
    
    var threeDoubles1 = [Double](count: 3, repeatedValue: 1.1)
    var threeDoubles2 = [Double](count: 3, repeatedValue:0.0)
    println("\(threeDoubles2)")
    
    var plusArr = threeDoubles1 + threeDoubles2 //the two types must be same
    println("\(plusArr)")
    
    var idc: [String:String] = ["1":"11", "2":"22", "3":"33", "4":"44"] //Dictionary type is unordered collection
    for (key, value) in idc{
        println("key: \(key), value:\(value)")
    }
    
    //An empty dictionary.
    var emptyDic = Dictionary<Int, String>()
}

func controlFlowAndFunc(){
    for character in "Hello" {
        println(character)
    }
    
    testFunction("Lee")
    
    let total = count("some arbitrary string!")
    println("\(total.vowels) vowels and \(total.consonants) consonants")
    
    var mathFunction: (Int, Int) -> Int = addTwoInts
    println("Result: \(mathFunction(2, 3))")
    
    /*All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions.

    Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.
    */
    //Nested Functions（嵌套函数）
    /*
    var currentValue = -4
    let moveNearerToZero = chooseStepFunction(currentValue < 0)
    while currentValue != 0 {
        println("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
    println("zero!")
    */
}

func testFunction(inputName: String) -> String{
    let resultName = inputName + " is nice!"
    println("test func string: \(resultName)")
    return resultName
}

func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string {
        switch String(character).lowercaseString {
        case "a", "e", "i", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            ++consonants
        default:
            ++others
        }
    }
    return (vowels, consonants, others)
}

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}

func closouresAndEnumerationsAndClasses(){
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var reversed = sorted(names, { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    var simpleReversed = sorted(names, >)
    println("closoures: \(reversed), \(simpleReversed)")

    let em1 = SomeFuck.two
    println("enum: \(em1)")
}

enum SomeFuck{
    case one
    case two
    case three
    case four
}

func typeCastin(){
    let library = [
        Movie(name: "Casablanca", dir: "Michael Curtiz"),
        Song(name: "Blue Suede Shoes", sg: "Elvis Presley"),
        Movie(name: "Citizen Kane", dir: "Orson Welles"),
        Song(name: "The One And Only", sg: "Chesney Hawkes"),
        Song(name: "Never Gonna Give You Up", sg: "Rick Astley")
    ]
    
    var movies = 0
    var songs = 0
    for item in library{
        if item is Movie{
            movies += 1
        }else{
            songs += 1
        }
    }
    println("movies cout: \(movies), songs count: \(songs)")
}

class Media {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: Media {
    var dir: String
    init(name: String, dir: String) {
        self.dir = dir
        super.init(name: name)
    }
}

class Song: Media {
    var sg: String
    init(name: String, sg: String) {
        self.sg = sg
        super.init(name: name)
    }
}

