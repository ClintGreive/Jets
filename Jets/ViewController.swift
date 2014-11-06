//
//  ViewController.swift
//  JetsAndChoppers
//
//  Created by Clint Greive on 28/09/2014.
//  Copyright (c) 2014 Clint Greive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aircraftImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    // arrays to hold Struct and Class instances
    var jetsArray:[JetStruct] = []
    var choppersArray:[ChopperClass] = []
    var chopperSubWeaponsArray:[ChopperSubWeapons] = []
    
    var currentIndex = 0
    
    // TUPLE: adding string and integer
    var currentAircraft = (aircraftType: "alphaString", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var firstJet = JetStruct()
        firstJet.name = "FA 18"
        firstJet.age = 1995
        firstJet.type = "Fighter / Attack"
        firstJet.image = UIImage(named: "f18alpha.jpg")
        
        // self.jetsArray.append(firstJet)
        
        var secondJet = JetStruct()
        secondJet.name = "F16"
        secondJet.age = 1976
        secondJet.type = "Multirole Fighter"
        secondJet.image = UIImage(named: "f16alpha.jpg")
        
        var thirdJet = JetStruct()
        thirdJet.name = "F15 Desert Eagle"
        thirdJet.age = 1972
        thirdJet.type = "Tactical Fighter"
        thirdJet.image = UIImage(named: "f15alpha.jpg")
        
        var forthJet = JetStruct()
        forthJet.name = "Typhoon"
        forthJet.age = 1994
        forthJet.type = "Multirole Fighter"
        forthJet.image = UIImage(named: "typhoon.jpg")
        
        self.jetsArray += [firstJet, secondJet, thirdJet, forthJet] // appending multiple objects to Array
        
        // instantiate the Chopper instance
        var firstChopper = ChopperClass()
        firstChopper.name = "AH-64A Apache"
        firstChopper.age = 1986
        firstChopper.type = "Attack"
        firstChopper.image = UIImage(named: "apache.jpg")
        firstChopper.isAttackChopper = true
        
        var secondChopper = ChopperClass()
        secondChopper.name = "UH-60 Blackhawk"
        secondChopper.age = 1979
        secondChopper.type = "Tactical Transport"
        secondChopper.image = UIImage(named: "blackhawk.jpg")
        secondChopper.isAttackChopper = true
        
        var thirdChopper = ChopperClass()
        thirdChopper.name = "UH-1 Huey"
        thirdChopper.age = 1956
        thirdChopper.type = "General Utility"
        thirdChopper.image = UIImage(named: "huey.jpg")
        thirdChopper.isAttackChopper = false
        
        var forthChopper = ChopperClass()
        forthChopper.name = "CH-47 Chinook"
        forthChopper.age = 1962
        forthChopper.type = "Troop Transport"
        forthChopper.image = UIImage(named: "chinook.jpg")
        forthChopper.isAttackChopper = false
        
        self.choppersArray += [firstChopper, secondChopper, thirdChopper, forthChopper]
        
        // instantiate subclass inhereting properties and using function
        var firstChopperWeapon = ChopperSubWeapons()
        firstChopperWeapon.name = "Hydra 70 rocket"
        firstChopperWeapon.age = 1940
        firstChopperWeapon.type = "Folding-Fin Rocket"
        firstChopperWeapon.image = UIImage(named: "hydra.jpg")
        firstChopperWeapon.isAttackChopper = true
        
        var secondChopperWeapon = ChopperSubWeapons()
        secondChopperWeapon.name = "AGM-114 Hellfire"
        secondChopperWeapon.age = 1974
        secondChopperWeapon.type = "air-to-surface missile"
        secondChopperWeapon.image = UIImage(named: "hellfire.jpg")
        secondChopperWeapon.isAttackChopper = false
        
        self.chopperSubWeaponsArray += [firstChopperWeapon, secondChopperWeapon]
        
        // need this in viewDidLoad so the image appears before the next bar button is pushed
        self.nameLabel.text = firstJet.name
        self.ageLabel.text = "\(firstJet.age)"
        self.typeLabel.text = firstJet.type
        self.aircraftImage.image = firstJet.image
        self.randomFactLabel.text = firstJet.randomFact()

        self.currentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        
        self.updateAircraftFunction()
        self.updateUIViewFunction()
        
        }
    
    // HELPER FUNCTIONS
    
    func updateAircraftFunction () {
        
        switch currentAircraft {
        case ("alphaString", _):
            let randomIndex = Int(arc4random_uniform(UInt32(self.choppersArray.count))) // 4 Choppers in Array
            self.currentAircraft = ("betaString", randomIndex)
        case ("betaString", _):
            let randomIndex = Int(arc4random_uniform(UInt32(self.chopperSubWeaponsArray.count))) // 2 Weapons
            self.currentAircraft = ("deltaString", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(self.jetsArray.count))) // 4 Jets
            self.currentAircraft = ("alphaString", randomIndex)
        }
    }

    func updateUIViewFunction () {
        
        UIView.transitionWithView(self.view, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAircraft.aircraftType == "alphaString" {
                let jetConstant = self.jetsArray[self.currentAircraft.index]
                self.nameLabel.text = jetConstant.name
                self.ageLabel.text = "\(jetConstant.age)"
                self.typeLabel.text = jetConstant.type
                self.aircraftImage.image = jetConstant.image
                self.randomFactLabel.text = jetConstant.randomFact()
            }
            else if self.currentAircraft.aircraftType == "betaString" {
                let chopperConstant = self.choppersArray[self.currentAircraft.index]
                self.nameLabel.text = chopperConstant.name
                self.ageLabel.text = "\(chopperConstant.age)"
                self.typeLabel.text = chopperConstant.type
                self.aircraftImage.image = chopperConstant.image
                self.randomFactLabel.text = chopperConstant.randomFact()
            }
            else if self.currentAircraft.aircraftType == "deltaString" {
                let chopperSubWeaponsConstant = self.chopperSubWeaponsArray[self.currentAircraft.index]
                self.nameLabel.text = chopperSubWeaponsConstant.name
                self.ageLabel.text = "\(chopperSubWeaponsConstant.age)"
                self.typeLabel.text = chopperSubWeaponsConstant.type
                self.aircraftImage.image = chopperSubWeaponsConstant.image
                self.randomFactLabel.text = chopperSubWeaponsConstant.randomFact()
            }
            self.randomFactLabel.hidden = false
            
            }, completion: { (finished: Bool) -> () in
        })
    }
}