//
//  Jet.swift
//  JetsAndChoppers
//
//  Created by Clint Greive on 28/09/2014.
//  Copyright (c) 2014 Clint Greive. All rights reserved.
//

import Foundation
import UIKit

struct Jet {
    var name = ""
    var age = 0
    var type = ""
    var image = UIImage(named: "")
    
    func randomFact() -> String {
        
        var randomNumber = Int(arc4random_uniform(UInt32(4)))
        var facts:String
        
        if randomNumber == 0 {
            facts = "On 9/11, after both of the twin towers were hit, some jet fighters took to the air without any live ammunition, knowing that to prevent the hijackers from striking their intended targets, the pilots might have to intercept and crash their fighters into the hijacked planes, ejecting at the last moment."
        }
        else if randomNumber == 1 {
            facts = "During WW2, Russian Fighter pilot T. Kuznetsov flew himself home after being shot down by stealing a Nazi fighter plane. The German pilot landed near his crash site to scrounge around the wreck to look for souvenirs."
        }
        else if randomNumber == 2 {
            facts = "During WW2, while parachuting from a damaged bomber, an American aviator downed a Japanese fighter plane by shooting the pilot in the head with his sidearm."
        }
        else {
            facts = "Chuck Yeager, the first man to fly faster than the speed of sound, revived his feat on October 14 2012 in an F-15 Eagle, to celebrate the 65th anniversary of breaking the sound barrier. He was 89 years old."
        }
        
        return facts
    }
}