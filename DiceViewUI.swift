//
//  ContentView.swift
//  OneDiceGame
//
//  Created by Charitra Prakash Yalimadannanavar on 2/12/24.
//

import SwiftUI

struct DiceViewUI: View {
    @StateObject var currentPlayer = PlayerTurnManager()
    @State var players: [DiceModel] = [
        DiceModel(playerName: "Player 1"),
        DiceModel(playerName: "Player 2"),
        DiceModel(playerName: "Player 3"),
        DiceModel(playerName: "Player 4")
    ]
    @State var gameIsOver = false // Track if the game is over
    @State var winnerName = "" // Track the name of the winner
    @State var showAlert = false // Track if the alert should be shown
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Text("Dice Game!!")
                       .font(.system(size: 20, weight: .black, design: .rounded))
                       .foregroundColor(.yellow)
                       .shadow(color: .gray, radius: 5, x: 5, y: 5)
                       .padding()


                    
                    Spacer()
                    
                    //Print Rounds
                    Text("Round \(currentPlayer.currentRound)")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.bar)
                    
                    //Dice rolls logic
                    HStack {
                        ForEach(0..<4) { index in
                            VStack {
                                DiceView(diceValue: players[index].diceResult).frame(width: 50, height: 50)
                                Text("\(players[index].playerName)")
                                Text("Scores: \(players[index].score)")
                            }
                        }
                    }.padding(25)
                    
                    //Roll dice and Rest Button Logic
                    HStack{
                        Spacer()
                        Button("Roll Dice") {
                            if !gameIsOver {
                                let currentPlayerIndex = currentPlayer.currentPlayerIndex
                                players[currentPlayerIndex].rollDice()
                                if players[currentPlayerIndex].score >= 25 {
                                    // Update game state to indicate game is over
                                    gameIsOver = true
                                    // Set the winner name
                                    winnerName = players[currentPlayerIndex].playerName
                                    showAlert = true
                                    // Show alert when game is over
                                }
                                currentPlayer.moveToNextPlayer()
                            }
                        }
                        .padding(10)
                        .disabled(gameIsOver)
                        // Disable button when game is over
                        .buttonStyle(.bordered)
                        .foregroundColor(.black)
                        
                        Spacer()
                        
                        //Reset Button
                        Button(action: resetGame, label: {
                            Text("Reset Game")
                        })
                        .padding(10)
                        .disabled(gameIsOver)
                        // Disable button when game is over
                        .buttonStyle(.bordered)
                        .foregroundColor(.black)
                        Spacer()
                    }
                    
                    //Is game over logic
                    if gameIsOver {
                        Text("\(winnerName) is the winner!")
                            .font(.headline)
                            .padding()
                    }
                    
                    //Navigation Link to Instructions and Author
                    HStack {
                        NavigationLink(destination: InstructionsView()) {
                            Text("Instructions to The Game!")
                        }.border(Color.black, width: 2)
                        .foregroundColor(.black)
                        .padding()
                        
                        NavigationLink(destination: AuthorView()) {
                            Text(" About The Author")
                        }.border(Color.black, width: 2)
                        .foregroundColor(.black)
                        .padding()
                    }//Navivagition HStack
                    
                }//VStack
            }.background(Color(UIColor(red: 1.0, green: 0.98, blue: 0.92, alpha: 1.0)))
            //ScrollView
        }//Navigation
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Game Over"), message: Text("\(winnerName) is the winner!"), dismissButton: .default(Text("OK"), action: {
                resetGame()
                gameIsOver = false
            }))
        }
    }
    
    //Function reset logic
    func resetGame() {
        // Reset scores of all players
        for index in 0..<players.count {
            players[index].score = 0
        }
        // Reset game state
        gameIsOver = false
        winnerName = ""
        currentPlayer.currentRound = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiceViewUI()
    }
}
