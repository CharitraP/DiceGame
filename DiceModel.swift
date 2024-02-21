//
//  File.swift
//  OneDiceGame
//
//  Created by Charitra Prakash Yalimadannanavar on 2/15/24.
//

import Foundation

class DiceModel: ObservableObject {
    let playerName: String
    @Published var diceResult: Int = 1 // Default value of 1
    @Published var score: Int = 0 // Initialize score to 0
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    func rollDice() {
        // Generate a random number between 1 and 6
        diceResult = Int.random(in: 1...6)
        
        // Update the score by adding the result of the dice roll
        score += diceResult
    }
}
