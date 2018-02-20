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
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxWrongGuesses = 8
    var wrongGuesses = 8
    var numGuessVar = 0
    override func viewDidLoad() {
        startDashes()
        super.viewDidLoad()
        guessButton.isEnabled = false
        playAgain.isEnabled = false
    }
    func startDashes() {
        var revealedWord = ""
        lettersGuessed += letterField.text!
        
        for letter in wordToGuess {
        if lettersGuessed.contains(letter) {
        revealedWord = revealedWord + " \(letter)"
        word.text = revealedWord
        } else {
        revealedWord += " _"
        word.text = revealedWord
            }
        }
        print(revealedWord)
    }

    func guessLetter() {
        startDashes()
        
        let currentLetterGuessed = letterField.text!
        //Decrements the wrong guesses remaining and shows the next flower image with one less petle
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuesses = wrongGuesses - 1
            flowerImage.image = UIImage(named: "flower"+"\(wrongGuesses)")
        }
        
        let revealedWord = word.text!
        
        //Stop Game if no more wrong guesses remaining
        if wrongGuesses == 0 {
            playAgain.isEnabled = true
            letterField.isEnabled = false
            guessButton.isEnabled = false
            numGuesses.text = "You Lost :("
            
        } else if !revealedWord.contains("_") {
            numGuesses.text = "You Win :)"
            
            playAgain.isEnabled = false
            letterField.isEnabled = false
            guessButton.isEnabled = false
        } else {
            let guess = ( numGuessVar == 1 ? "Guess" : "Guesses")
            numGuesses.text = "You've Made \(numGuessVar) \(guess)"
            numGuessVar = numGuessVar + 1
            }
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
        guessLetter()
        updateUIAfterGuess()
        
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        playAgain.isHidden = true
        letterField.isEnabled = true
        guessButton.isEnabled = true
        flowerImage.image = UIImage(named: "flower8")
        wrongGuesses = maxWrongGuesses
        lettersGuessed = ""
        startDashes()
        numGuessVar = 0
        numGuesses.text = "You've Made 0 Guesses"
    }
}
    


