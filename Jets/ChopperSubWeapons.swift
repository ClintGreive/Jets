//
//  ChopperSubWeapons.swift
//  JetsAndChoppers
//
//  Created by Clint Greive on 24/10/2014.
//  Copyright (c) 2014 Clint Greive. All rights reserved.
//

import Foundation

class ChopperSubWeapons: Chopper {
    
    override func randomFact() -> String {
        
        var randomFactString:String
        
        if isAttackChopper {
            randomFactString = "Apaches usually fly with two Hydra rocket launchers in place of two of the Hellfire missile sets. Each rocket launcher carries 19 folding-fin 2.75-inch aerial rockets, secured in launching tubes."
        }
        else {
            randomFactString = "The Hydra 70 rocket is a weapon derived from the 2.75 inch (70 mm) Mk 4/Mk 40 Folding-Fin Aerial Rocket developed by the United States Navy for use as a free-flight aerial rocket in the late 1940s."
        }
        return randomFactString
    }
}