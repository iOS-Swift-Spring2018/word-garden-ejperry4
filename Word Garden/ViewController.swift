//
//  ViewController.swift
//  Word Garden
//
//  Created by Ej Perry on 2/11/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var letterField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var numGuesses: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var flowerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessButton.isEnabled = false
        playAgain.isEnabled = false
    }
    
    func updateUIAfterGuess () {
        letterField.resignFirstResponder()
        letterField.text = ""
    }
    
    
    @IBAction func letterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = letterField.text?.last {
            letterField.text = "\(letterGuessed)"
            guessButton.isEnabled = true
        } else {
            guessButton.isEnabled = false
        }
    }
 
    @IBAction func doneKeyPressed(_ sender: UITextField) {
       
        updateUIAfterGuess()
        
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
    }
    
    
}

