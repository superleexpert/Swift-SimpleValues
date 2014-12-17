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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

