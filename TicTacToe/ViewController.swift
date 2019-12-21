//
//  ViewController.swift
//  TicTacToe
//
//  Created by paulgiordano on 12/21/19.
//  Copyright © 2019 paulgiordano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    
    
    @IBAction func reset(_ sender: UIButton) {
        
        activePlayer = 1
        
        activeGame = true

        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - crosses, 2 - noughts
        
        
        for i in 1..<10 {
                       
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for:[])
                
            }
            
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
               
            
        }
        
    }
    
    // 1 = crosses, 2 = noughts
    var activePlayer = 1
    
    var activeGame = true

    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - crosses, 2 - noughts
    
    var winningCombonations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
                
        var activePosition = sender.tag - 1
        
        if (gameState[activePosition] == 0 && activeGame){
            
            gameState[activePosition] = activePlayer

            
            if (activePlayer == 1){
               
                sender.setImage(UIImage(named: "cross.png"), for: [])

                activePlayer = 2
                                
            } else {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])

                activePlayer = 1
                
            }
            
            for combonation in winningCombonations {
                
                if (gameState[combonation[0]] != 0 && gameState[combonation[0]] == gameState[combonation[1]] && gameState[combonation[1]] == gameState[combonation[2]]) {
                    
                    //Winner has been found
                    
                    print(gameState[combonation[0]])
                    activeGame = false
                    
                    
                    if (gameState[combonation[0]] == 1) {
                        
                        winnerLabel.text = "X's Won!"
                        
                    } else {
                        
                        winnerLabel.text = "O's Won!"

                    }
                    
                      winnerLabel.isHidden = false
                    
                      playAgainButton.isHidden = false
                    
                }
                
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get rid of winner label and play again button
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
    }


}

