//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var allButtons: [GameButton] = []
    @IBOutlet weak var ticTacToeLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var p1WinCount: UILabel!
    @IBOutlet weak var p2WinCount: UILabel!
    @IBOutlet weak var p1p2WinLabel: UILabel!
    @IBOutlet weak var button11: GameButton!
    @IBOutlet weak var button12: GameButton!
    @IBOutlet weak var button13: GameButton!
    @IBOutlet weak var button21: GameButton!
    @IBOutlet weak var button22: GameButton!
    @IBOutlet weak var button23: GameButton!
    @IBOutlet weak var button31: GameButton!
    @IBOutlet weak var button32: GameButton!
    @IBOutlet weak var button33: GameButton!
    
    let ticTacToe = ticTacToeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.isHidden = true
        loseLabel.isHidden = true
        p1WinCount.isHidden = true
        p2WinCount.isHidden = true
        p1p2WinLabel.isHidden = true
    }
    
    @IBAction func gameButtons(_ sender: GameButton) {
        ticTacToe.clickABox()
        if ticTacToe.playerTracker == true {
            sender.setImage(#imageLiteral(resourceName: "xbutton"), for: .normal)
            playerTurnLabel.text = "Player Two's Turn"
        } else {
            sender.setImage(#imageLiteral(resourceName: "oButton"), for: .normal)
            playerTurnLabel.text = "Player One's Turn"
        }
        sender.isEnabled = false
        func addToArray() {
            if ticTacToe.playerTracker == true {
                ticTacToe.playerOneArray.append((sender.column, sender.row))
                ticTacToe.tagPlayerOneArray.append(sender.tag)
            } else {
                ticTacToe.playerTwoArray.append((sender.column, sender.row))
                ticTacToe.tagPlayerTwoArray.append(sender.tag)
            }
        }
        addToArray()
        ticTacToe.checkWinner()
        if ticTacToe.youWin == true {
            if ticTacToe.playerTracker == true {
                winLabel.text = "P1 Wins!"
                winLabel.isHidden = false
            } else {
                winLabel.text = "P2 Wins!"
                winLabel.isHidden = false
            }
            allButtons = [button11, button12, button13, button21, button22, button23, button31, button32, button33]
            for button in allButtons {
                button.isEnabled = false
            }
        }
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        allButtons = [button11, button12, button13, button21, button22, button23, button31, button32, button33]
        ticTacToe.youWin = false
        ticTacToe.playerOneArray = []
        ticTacToe.playerTwoArray = []
        for button in allButtons {
            button.isEnabled = true
            button.setImage(nil, for: .normal)
        }
        winLabel.isHidden = true
        loseLabel.isHidden = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

