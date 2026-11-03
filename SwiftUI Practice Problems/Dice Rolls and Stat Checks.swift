//
//  ContentView.swift
//  Dice Rolls and Stat Checks
//
//  Created by Gunny on 11/1/26.
//

/* This Dice Roller & Stat Checker app will let you practice using
@State, random number generation, and conditional UI elements
based on your results.

THE "DICE ROLLER & STAT CHECKER" PRACTICE APP
This project focuses on logic and conditional views rather
than just math.
 
PROBLEM 1: THE STAT PICKER
Create a Picker that lets the user select a stat to check: "Strength",
"Dexterity", or "Intelligence". Store this in a @State variable.

PROBLEM 2: THE DICE ROLLER
Add a "Roll D20" Button. When tapped, it should generate
a random number between 1 and 20 and store it in a @State
variable. Display this number prominently on the screen.

PROBLEM 3: THE RESULT
Add a Text view that changes based on the roll. If the
roll is 10 or higher, display "Success!". If it is 9 or
lower, display "Failure!".

PROBLEM 4: CRITICAL ALERTS
Add an alert that triggers only on a "Natural 20" or a
"Natural 1".
If they roll a 20, the alert should say "Critical Success!"
If they roll a 1, the alert should say "Critical Failure!" */

import SwiftUI
struct ContentView: View {

    @State private var statNames = ["Strength","Dexterity", "Wisdom", "Fortitude"]
    @State private var statBlock = ["Strength": 14 ,"Dexterity": 13 , "Wisdom": 18, "Fortitude": 16]
    @State private var selectedStat = ""
    @State private var selectedStatValue = 0
    @State private var diceRoll = 0
    @State private var rollResultMessage = ""
    @State private var statMod = 0
    @State private var rollSuccess = "Result:"
    @State private var showingCrit = false
    
    var body: some View {
        NavigationStack {
            ZStack { // background stack
                AngularGradient(colors: [.black, .red, .blue, .gray, .red, .black], center: .center)
                    .ignoresSafeArea()
                
                VStack { // overall screen stack
                    HStack { // H1
                        Text("Select stat to check:")
                            .padding(.leading, 20) // padding to the left of text
                            .foregroundStyle(.secondary) // let some background show through text
                        
                        Picker("Stat", selection: $selectedStat) { // bind user pick to selectedStat
                            ForEach(statNames, id: \.self) { // use statNames elements as source
                                Text($0) // use each element as option in picker
                            }
                        }
                        .pickerStyle(.wheel)
                        
                    } // end H1
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    // apply changes to HStack look & feel
                    
                    HStack { // H2
                        Spacer()
                        Text("\(selectedStat) Score:")
                            .font(.title)
                        Text(statSelect(statName: selectedStat), format: .number)
                        /* run statSelect function, which passes in the key from
                         statBlock dictionary matching selectedStat string. Returns
                         value from dictionary that is tied to aformentioned key.
                         Formats text as a number */
                            .font(.title)
                        Spacer()
                        Text("Mod:")
                            .font(.title)
                        Text(updateStatMod(statName: selectedStat), format: .number)
                        /* run updateStatMod function, which passes in the key from
                         statBlock dictionary matching selectedStat string. Returns
                         calculated mod value based on selectedStat value.
                         Formats text as a number */
                            .font(.title)
                        Spacer()
                    } // end H2
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    // apply changes to HStack look & feel
                    
                    HStack { // H3
                        VStack { // stacks button and DC text
                            Button {
                                diceRoll = Int.random(in: 1...20)
                                
                                if (diceRoll + updateStatMod(statName: selectedStat)) >= 10 {
                                    rollSuccess = "Success!"
                                } else {
                                    rollSuccess = "Failure!"
                                } // define whether success / failure is displayed
                                
                                if diceRoll == 1 || diceRoll == 20 {
                                    showingCrit = true
                                } // define critical fail / hit values, and displays alert if rolled
                                
                                rollResultMessage = """
                                You rolled a \(diceRoll),
                                +\(updateStatMod(statName: selectedStat)) makes \(diceRoll + updateStatMod(statName: selectedStat)) 
                                """
                            } label: { // start manipulations to button
                                Text("Make a \(selectedStat) check")
                                    .frame(maxWidth: 200, maxHeight: 40)
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .background(.secondary)
                                    .clipShape(.capsule)
                                    .padding()
                            }
                            .alert("Critcal \(rollSuccess) You've rolled a nat \(diceRoll)", isPresented: $showingCrit) {
                                Button("Dismiss") { }
                            } // display alert, updates showingCrit bool state
                            
                            Text("DC: 10")
                        }
                        
                        Text(rollResultMessage) /* display success / failure message
                                                 based on roll result */
                    } // end H3
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    // apply changes to HStack look & feel
                    
                    HStack { // H4
                        Text(rollSuccess)
                            .font(.largeTitle)
                    } // end H4
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    // apply changes to HStack look & feel
                    
                } // end of VStack
            } // end of ZStack
            
            .navigationTitle("Roll 'em, Check 'em")
            // screen title in top left
        }
        
    }
    // functions live here
    func statSelect(statName: String) -> Int {
        let statName = selectedStat
        let statValue = statBlock[statName, default: 0]
        return statValue
    }
    
    func updateStatMod(statName: String) -> Int {
        let statName = selectedStat
        let statValue = statBlock[statName, default: 0]
        var statMod = 0
        
        if statValue > 17 {
            statMod = 3
        } else if statValue > 15 {
            statMod = 2
        } else if statValue >= 12 {
            statMod = 1
        }
        return statMod
    }
    }
    
#Preview {
    ContentView()
}
