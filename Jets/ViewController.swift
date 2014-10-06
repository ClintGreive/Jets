//
//  ViewController.swift
//  Jets
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
    
    var jetsArray:[Jet] = [] // Array
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var firstJet = Jet()
        firstJet.name = "FA 18"
        firstJet.age = 1995
        firstJet.type = "Fighter / Attack"
        firstJet.image = UIImage(named: "f18alpha.jpg")
        
//      self.jetsArray.append(firstJet)
        
//      println("This Jet is named \(firstJet.name) and it is \(firstJet.age) year of age, being a \(firstJet.type). \(firstJet.image)")
        
        var secondJet = Jet()
        secondJet.name = "F16"
        secondJet.age = 1976
        secondJet.type = "Multirole Fighter"
        secondJet.image = UIImage(named: "f16alpha.jpg")
        
        var thirdJet = Jet()
        thirdJet.name = "F15 Desert Eagle"
        thirdJet.age = 1972
        thirdJet.type = "Tactical Fighter"
        thirdJet.image = UIImage(named: "f15alpha.jpg")
        
        var forthJet = Jet()
        forthJet.name = "Typhoon"
        forthJet.age = 1994
        forthJet.type = "Multirole Fighter"
        forthJet.image = UIImage(named: "typhoon.jpg")
        
        // need this in viewDidLoad so the image appears before the next bar button is pushed
        self.aircraftImage.image = firstJet.image
        self.nameLabel.text = firstJet.name
        self.ageLabel.text = "\(firstJet.age)"
        self.typeLabel.text = firstJet.type
        self.randomFactLabel.text = firstJet.randomFact()
        
        self.jetsArray += [firstJet, secondJet, thirdJet, forthJet] // appending multiple objects to Array
        
        self.currentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
//      println("\(jetsArray.count)")
        
        // random number generation
        var randomIndex = Int(arc4random_uniform(UInt32(jetsArray.count)))
        
        // if currentIndex equals randomInex, keep generating a randomIndex so it's not the same image
        while self.currentIndex == randomIndex {
            randomIndex = Int(arc4random_uniform(UInt32(jetsArray.count)))
        }
        
        let randomJets = jetsArray[randomIndex]
        
        self.currentIndex = randomIndex
        
        UIView.transitionWithView(self.view, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
          
            self.aircraftImage.image = randomJets.image
            self.nameLabel.text = randomJets.name
            self.ageLabel.text = "\(randomJets.age)"
            self.typeLabel.text = randomJets.type
            self.randomFactLabel.text = randomJets.randomFact()

            }, completion: { (finished: Bool) -> () in
            })
        }

}

