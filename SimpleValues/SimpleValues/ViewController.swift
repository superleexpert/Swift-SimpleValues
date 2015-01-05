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



