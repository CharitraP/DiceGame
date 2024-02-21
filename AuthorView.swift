//
//  AuthorView.swift
//  DiceGame
//
//  Created by Charitra Prakash Yalimadannanavar on 2/12/24.
//

import SwiftUI

struct AuthorView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var bioSliderValue = 0.0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("About The Author!!")
                   .font(.system(size: 20, weight: .black, design: .rounded))
                   .foregroundColor(.yellow)
                   .shadow(color: .gray, radius: 5, x: 5, y: 5)
                   .padding()
                
                Image("Author")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()
                
                Text("Charitra Prakash Yalimadannanavar")
                    .foregroundColor(.green)
                    .padding()
                
                Text(bioText(for: Int(bioSliderValue)))
                    .foregroundColor(.black)
                    .padding()
                
                Slider(value: $bioSliderValue, in: 0...4, step: 1)
                    .padding()
                
                Button("Click Me") {
                    showAlert.toggle()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Bye!"), message: Text("Thanks for checking out my app!"), dismissButton: .default(Text("OK")))
                }
                .buttonStyle(.bordered)
                .font(.callout)
                .foregroundColor(.black)
                
                Button("Back to Main Page") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .buttonStyle(.bordered)
                .font(.callout)
                .foregroundColor(.black)
            }.background(Color(UIColor(red: 0.87, green: 0.98, blue: 1.0, alpha: 1.0)))
            .padding()
            .navigationBarTitle("Author Information", displayMode: .inline)
        }
    }
    
    private func bioText(for value: Int) -> String {
        switch value {
        case 0:
            return "Hi Friends, Thanks for Playing the Game. Let me Share something about me, Be tuned!."
        case 1:
            return "My name is Charitra, a Software Engineer, who worked previously in Fossil Group and Infosys Limitted!."
        case 2:
            return "As I grew older, I was always fond of playing Dice game, but finding dice was a difficult task."
        case 3:
            return "Hence was always wondering if I can play the dice game on my phone, So here I am creating my own dice game."
        case 4:
            return "A little more about me, I have a passion for coding and creating apps that add fun to people's lives."
        default:
            return ""
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
