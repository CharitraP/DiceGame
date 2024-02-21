//
//  DiceView.swift
//  OneDiceGame
//
//  Created by Charitra Prakash Yalimadannanavar on 2/15/24.
//

import SwiftUI

struct DiceView: View {
    let diceValue: Int
    
    var body: some View {
        Image("Dice\(diceValue)") // Assuming you have images named "dice1", "dice2", ..., "dice6"
            .resizable()
            .aspectRatio(contentMode:.fit)
    }
}
