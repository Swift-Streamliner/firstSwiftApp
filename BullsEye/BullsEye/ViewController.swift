//
//  ViewController.swift
//  BullsEye
//
//  Created by Tiger Mei on 05.11.2019.
//  Copyright © 2019 Tiger Mei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        
        let difference : Int = abs(currentValue - targetValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }


}

