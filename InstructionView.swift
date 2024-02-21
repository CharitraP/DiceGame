//
//  InstructionsView.swift
//  DiceGame
//
//  Created by Charitra Prakash Yalimadannanavar on 2/12/24.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Dice Game!!")
               .font(.system(size: 20, weight: .black, design: .rounded))
               .foregroundColor(.yellow)
               .shadow(color: .gray, radius: 5, x: 5, y: 5)
               .padding()
            
        List {
            Section(header:Text("    A  simple  rule  to win  the  game!!").font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.purple)
                .padding()){
            
            Text("1. To Roll the dice click on Roll Dice Button.")
                .foregroundStyle(.black)
                .background(.bar)
                
            
            Text("2. Every player gets equal chance to roll the dice in a clockwise manner.")
                .foregroundStyle(.black)
                .background(.bar)
                
            
            Text("3. Total Score is a summation of your scores from each Game.")
                .foregroundStyle(.black)
                .background(.bar)
                

            Text("4. To win the game, the Total score needs to be more than 25.")
                .foregroundStyle(.black)
                .background(.bar)
                
            
            Text("5. Rounds will show how many rounds have been passed.")
                .foregroundStyle(.black)
                .background(.bar)
                

            Text("6. If you want to reset the Game, click on Reset the Game button.")
                .foregroundStyle(.black)
                .background(.bar)
                
            
            Text("7. Once the game is finished, the game will be reset and you can start the game again!")
                .foregroundStyle(.black)
                .background(.bar)
                
                }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Instructions", displayMode: .inline)
            Spacer()
            
            Button("Back to Main Page") {
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            .padding()
            
            Spacer()
        }.background(Color(UIColor(red: 1.0, green: 0.98, blue: 0.92, alpha: 1.0)))
        .navigationBarTitle("Instructions", displayMode: .inline)
        
    }
}


struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
