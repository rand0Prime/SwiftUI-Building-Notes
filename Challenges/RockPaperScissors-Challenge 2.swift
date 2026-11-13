//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Gunny on 11/11/26.
//

// review of material leading to this challenge:
// https://www.hackingwithswift.com/guide/ios-swiftui/2/1/what-you-learned

import SwiftUI
// start non-state code block

struct StackBackgroundStyle: ViewModifier { // template for stack background mats
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 20))
    }
}

extension View { // shortens background style to an extension on View type
    func stackStyle() -> some View {
        modifier(StackBackgroundStyle())
    }
}

struct PlayerButtonStyle: ViewModifier { // template for player button mats
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 75)
            .clipShape(.capsule)
    }
}

extension View { // shortens player button style to an extension on View type
    func choiceStyle() -> some View {
        modifier(PlayerButtonStyle())
    }
}

let choices = ["Rock", "Paper", "Scissors"]

// end code non-state code block

// Start content display
struct ContentView: View {

    @State private var playerScore = 0
    @State private var roundNumber = 1
    @State private var playerChoice = 1
    @State private var gameChoice = 1
    @State private var winCondition = true
    /* st win condition to win or lose against gameChoice,
     starting at lose */
    @State private var roundWon = true
    @State private var displayingHint = false
    @State private var displayingRoundRecap = false
    @State private var displayingFinalRecap = false
    
    func newRound() {
        if roundNumber < 10 {
            roundNumber += 1
            winCondition.toggle()
            gameChoice = Int.random(in: 1...3) - 1
        } else {
            displayingFinalRecap = true

        }
    } // rolls a new selection for gameChoice, displays choice
    
    func scoreRound() {
        let player = choices[playerChoice] // grabs player option
        let game = choices[gameChoice] // grabs game option
        
        if winCondition == true { // logic for scoring 'win' goal rounds
            switch game {
            case "Rock": player == "Paper" ? (roundWon = true) : (roundWon = false)
            case "Paper": player == "Scissors" ? (roundWon = true) : (roundWon = false)
            case "Scissors": player == "Rock" ? (roundWon = true) : (roundWon = false)
            default: roundWon = true
            } /* against x, if player picks y: then they win, otherwise the other two
               options result in a lost round */
            
        } else { // logic for scoring 'lose' goal rounds
            switch game {
            case "Rock": player == "Scissors" ? (roundWon = true) : (roundWon = false)
            case "Paper": player == "Rock" ? (roundWon = true) : (roundWon = false)
            case "Scissors": player == "Paper" ? (roundWon = true) : (roundWon = false)
            default: roundWon = true
            }/* against x, if player picks y: then they win, otherwise the other two
              options result in a lost round (inverse of above switch block)  */
        }
        
        if roundWon == true {
            playerScore += 1
        } else {
            playerScore >= 1 ? (playerScore -= 1) : (playerScore = 0)
        }
        displayingRoundRecap = true
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("rockpaperscissorsBackground") // background image
                    .resizable()
            
                VStack { // outermost VStack
                    Spacer()
                    Spacer()
                    HStack { // for top row
                        Text("Round \(roundNumber)")
                            .padding()
                        Text("Score: \(playerScore)")
                            .padding()
                    } // end top row
                    .stackStyle() // applies stack styling via extension modifier
                    .font(.title)
                    
                    HStack {
                        Text("Opponent: \(choices[gameChoice])")
                            .stackStyle()
                            .font(.title2)
                        Image("\(choices[gameChoice])".lowercased())
                            .resizable()
                            .choiceStyle()
                            .padding()
                            .stackStyle()
                        
                    }
                    HStack {
                        Text("Goal: \(winCondition == true ? "Win" : "Lose")")
                        // tells player to win or lose
                            .stackStyle()
                            .font(.title2)
                        
                        Button {
                            displayingHint = true
                        } label: {
                            Text("Hint")
                                .font(.title2)
                        }
                        .stackStyle()
                        .font(.title)
                        .alert("Don't play \(choices[gameChoice])", isPresented: $displayingHint) {
                            Button("Thanks a ton") { }
                            // hit button
                        }
                    }
                    
                    HStack { // player choice row
                        Button {
                            playerChoice = 0
                            scoreRound()
                        } label: {
                            Image("rock")
                                .resizable()
                                .choiceStyle() // applies choice styling via extension modifier
                                .padding() // space between options and edge of display
                        }
                        
                        Button {
                            playerChoice = 1
                            scoreRound()
                        } label: {
                            Image("paper")
                                .resizable()
                                .choiceStyle()
                                .padding()
                        }
            
                        Button {
                            playerChoice = 2
                            scoreRound()
                        } label: {
                            Image("scissors")
                                .resizable()
                                .choiceStyle()
                                .padding()
                        }
                    } // end player choice row
                    .stackStyle()
                    Spacer()
                } // end outermost VStack
            } // end ZStack
            .ignoresSafeArea()
            .navigationTitle("RockPaperScissors")
            
            .alert("Game Over!", isPresented: $displayingFinalRecap) {
                Button("New Game") {
                    roundNumber = 1
                    playerScore = 0
                    gameChoice = Int.random(in: 1...3) - 1
                }
            } message: {
                Text("Final Score: \(playerScore) out of 10 rounds won")
            }
            
            .alert(roundWon == true ? "Round won! Score: \(playerScore)" : "Round lost... Score: \(playerScore)", isPresented: $displayingRoundRecap) {
                Button("Continue") {
                    newRound()
                }
            }
        } // end NavigationStack
    }
}

#Preview {
    ContentView()
}
