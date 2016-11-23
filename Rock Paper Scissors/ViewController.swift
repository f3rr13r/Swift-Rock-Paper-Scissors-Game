//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Harry Ferrier on 8/5/16.
//  Copyright © 2016 CASTOVISION LIMITED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playerChoice: UIImageView!
    @IBOutlet weak var computerChoice: UIImageView!
    @IBOutlet weak var roundResultLabel: UILabel!
    
    @IBOutlet weak var playerTotalScoreLabel: UILabel!
    @IBOutlet weak var computerTotalScoreLabel: UILabel!
    
    @IBOutlet weak var gameOverView: UIView!
    
    @IBOutlet weak var gameWinnerLabel: UILabel!
    @IBOutlet weak var playAgainLabel: UILabel!
    
    
    
    var computerChoiceString = ""
    var playerChoiceString = ""
    
    var playerTotalScore = 0
    var computerTotalScore = 0
    
    var gameIsActive = true
    
    @IBAction func playerChoosesRock(_ sender: AnyObject) {
        
        
        if gameIsActive == true {
            
            playerChoiceString = "rock"
            
            playerChoice.image = UIImage(named: "rock.jpg")
            
            computerMakesChoice()
            
            findRoundWinner()
            
            findGameWinner()
        
        }
    }
    
    
    @IBAction func playerChoosesScissors(_ sender: AnyObject) {
        
        if gameIsActive == true {
        
        playerChoiceString = "scissors"
            
        playerChoice.image = UIImage(named: "scissors.png")
        
        computerMakesChoice()
            
        findRoundWinner()
            
        findGameWinner()
            
        }
        
    }
    
    
    @IBAction func playerChoosesPaper(_ sender: AnyObject) {
        
        if gameIsActive == true {
            
        playerChoiceString = "paper"
        
        playerChoice.image = UIImage(named: "paper.png")
        
        computerMakesChoice()
            
        findRoundWinner()
            
        findGameWinner()
            
        }
        
    }
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 1.0, animations: {
            
            self.gameOverView.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 500)
            
        })
        
        
        playerChoiceString = ""
        playerChoice.image = UIImage(named: "")
        playerTotalScore = 0
        playerTotalScoreLabel.text = "\(playerTotalScore)"
        
        computerChoiceString = ""
        computerChoice.image = UIImage(named: "")
        computerTotalScore = 0
        computerTotalScoreLabel.text = "\(computerTotalScore)"
        
        
        
        gameIsActive = true
        
        
        
    }
    
    
    
    
    
// ** COMPUTER CHOOSES ROCK, PAPER OR SCISSORS AT RANDOM, AND ASSIGNS THE APPROPRIATE IMAGE TO IT'S CHOICE ** //
    
    func computerMakesChoice() {
        
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        if randomNumber == 0 {
            
            computerChoiceString = "rock"
            computerChoice.image = UIImage(named: "\(computerChoiceString).jpg")
            
        } else if randomNumber == 1 {
            
            computerChoiceString = "paper"
            computerChoice.image = UIImage(named: "\(computerChoiceString).png")
            
        } else {
            
            computerChoiceString = "scissors"
            computerChoice.image = UIImage(named: "\(computerChoiceString).png")
            
        }
        
    }
    
    
    
    
    
    func findRoundWinner() {
        
// ** HANDLE DRAW OUTCOME ** //
        
        if playerChoiceString == computerChoiceString {
            
            roundResultLabel.text = "It's a draw"
            
        } else {
        
            
// ** ROCK VARIATIONS ** //
            
            if playerChoiceString == "rock" {
            
                if computerChoiceString == "paper" {
                
                    roundResultLabel.text = "Paper beats Rock"
                    
                    computerTotalScore += 1
                
                } else {
                
                    roundResultLabel.text = "Rock beats Scissors"
                    
                    playerTotalScore += 1
                
                }
            
            }
            
// ** PAPER VARIATIONS ** //
            
            if playerChoiceString == "paper" {
            
                if computerChoiceString == "scissors" {
                
                    roundResultLabel.text = "Scissors beat Paper"
                    
                    computerTotalScore += 1
                
                } else {
                
                    roundResultLabel.text = "Paper beats Rock"
                    
                    playerTotalScore += 1
                
                }
            
            }
            
// ** SCISSORS VARIATIONS ** //
            
            if playerChoiceString == "scissors" {
            
                if computerChoiceString == "rock" {
                
                    roundResultLabel.text = "Rock beats Scissors"
                    
                    computerTotalScore += 1
                
                } else {
                
                    roundResultLabel.text = "Scissors beat Paper"
                    
                    playerTotalScore += 1
                }
            }
            
            playerTotalScoreLabel.text = String(playerTotalScore)
            computerTotalScoreLabel.text = String(computerTotalScore)

        }
    
    }
    

    
    
// ** CHECK TO SEE IF USER OR COMPUTER HAS WON 3 ROUNDS, AND HAS THEREFORE WON THE GAME ** //
    
    func findGameWinner() {
    
        if playerTotalScore == 3 {
        
            gameIsActive = false
            
            gameOverView.isHidden = false
            gameWinnerLabel.text = "Player wins!!"
            gameOverView.center = CGPoint(x: view.center.x, y: view.center.y + 500)
            
            UIView.animate(withDuration: 1.0, animations: {
                
                self.gameOverView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                
            })
        
        }
        
        if computerTotalScore == 3 {
        
            gameIsActive = false
            
            gameOverView.isHidden = false
            gameWinnerLabel.text = "Computer wins!!"
            gameOverView.center = CGPoint(x: view.center.x, y: view.center.y + 500)
            
            UIView.animate(withDuration: 1.0, animations: {
                
                self.gameOverView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                
            })
        
        }
    
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        gameOverView.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

