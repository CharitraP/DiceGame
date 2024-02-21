//
//  PlayerTurnManager.swift
//  OneDiceGame
//
//  Created by Charitra Prakash Yalimadannanavar on 2/15/24.
//

import Foundation

class PlayerTurnManager: ObservableObject {
    @Published var currentPlayerIndex: Int = 0
    @Published var currentRound: Int = 1
    
    func moveToNextPlayer() {
        currentPlayerIndex = (currentPlayerIndex + 1) % 4
        if currentPlayerIndex == 0 {
            currentRound += 1
        }
    }
}
