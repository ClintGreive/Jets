//
//  Chopper.swift
//  JetsAndChoppers
//
//  Created by Clint Greive on 22/10/2014.
//  Copyright (c) 2014 Clint Greive. All rights reserved.
//

import Foundation
import UIKit

class ChopperClass {
    var age = 0
    var name = ""
    var type = ""
    var image = UIImage(named: "")
    var isAttackChopper = false
    
    func randomFact() -> String {
        
        var randomFact:String
        
        if self.isAttackChopper { // can use self. notation on property due to being a class
            randomFact = "The fastest speed recorded by a helicopter is around 400 kph (248 mph)."
        }
        else {
            randomFact = "The longest distance traveled in a helicopter without landing is 3562 km (2213 miles)."
        }
        return randomFact
    }
}