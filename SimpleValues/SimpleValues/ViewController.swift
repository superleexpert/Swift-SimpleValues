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
        
        simpleValues();
        functionsAndClosures();
        objectsAndClasses();
        
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









