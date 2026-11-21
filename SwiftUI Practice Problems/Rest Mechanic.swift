//
//  ContentView.swift
//  Rest Mechanic
//
//  Created by Gunny on 11/16/26
//


/* TODO:
 0. add MARK points for view chunks ✅
 1. stop increase to HP / slots once recovery is at max ✅
 2. create alert that shows estimated recovery complete time (bonus) ◼️
 3. clean up gaps in code ✅
 4. notate code ✅
 */

import SwiftUI
// MARK: structs
struct SquareViewBackground: ViewModifier { // template for square card
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 175, maxHeight: 175)
            .background(.ultraThinMaterial)
            .foregroundStyle(.white)
            .shadow(radius: 5)
            .cornerRadius(20)
            .padding()
    }
}
extension View { // make extension for square card
    func squareStyle() -> some View {
        modifier(SquareViewBackground())
    }
}

struct RectangleViewBackground: ViewModifier { // tempate for rect card
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: (.infinity), maxHeight: 125)
            .background(.ultraThinMaterial)
            .foregroundStyle(.white)
            .shadow(radius: 5)
            .cornerRadius(20)
            .padding()
    }
}
extension View { // make extension for square card
    func rectangleStyle() -> some View {
        modifier(RectangleViewBackground())
    }
}

struct HeaderTextStyle: ViewModifier { // template for header text font
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.secondary)
            .foregroundStyle(.black)
    }
}
extension View { // extension for header text font
    func titleText() -> some View {
        modifier(HeaderTextStyle())
    }
}

struct BodyTextStyle: ViewModifier { // template for body text font
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .foregroundStyle(.black)
            .bold()
    }
}
extension View { // template for body text font
    func bodyText() -> some View {
        modifier(BodyTextStyle())
    }
}

struct ContentView: View {
    // MARK: state vars
    @State private var maxHP = 37
    @State private var currentHP = 24
    @State private var hpRecRate = 2
    
    @State private var availableSlots = 1
    @State private var maxSlots = 4
    @State private var slotRecRate = 15
    
    @State private var restDuration = 0
    @State private var displayRestAlert = false
    
    var maxRestMinutes = 120
    
    var missingHP: Int {
        maxHP - currentHP
    }

    var missingSlots: Int {
        maxSlots - availableSlots
    }
    
    func recoverHP() -> Int {
        if currentHP > maxHP {
            
        }
        return missingHP * hpRecRate
    }
    
    func recoverSlots() -> Int {
        return missingSlots * slotRecRate
    }
    
    func displayHPRecovered() -> Int { // display projected heal amount
       
        let recoveryInterval = restDuration / 5
        let hpRecovered = recoveryInterval * hpRecRate
       
        return hpRecovered <= missingHP ? hpRecovered : missingHP
        // caps hp recoverable at missingHP, shows missingHP if exceeded
    }
    
    func displaySlotsRecovered() -> Int {
       
        let recoveryInterval = restDuration / 15
        let slotsRecovered = recoveryInterval * slotRecRate / 15
       
        return slotsRecovered <= missingSlots ? slotsRecovered : missingSlots
    }
    // end State block
    
    // MARK: state functions
    func displaySlots() -> String { // show available skill/spell slots in VStack 2
        var slotAvailability = ""
        var tempAvailableSlots = maxSlots - availableSlots
        var tempMaxSlots = maxSlots
        
        // logic for adding/removing slot indicators
        while tempMaxSlots != 0 {
            slotAvailability += "🟩"
            tempMaxSlots -= 1
            if tempAvailableSlots != 0 {
                slotAvailability.removeLast()
                tempAvailableSlots -= 1
                slotAvailability += "◾️"
            }
        }
        return slotAvailability
    }
    // end State functions
    
    // MARK: body start
    var body: some View {
        NavigationStack {
            ZStack { // background
                Image("moon background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // MARK: outside VStack
                VStack { // outside VStack
                    HStack { // H1
                       
                        // MARK: top left square
                        VStack { // V1
                            Spacer()
                            Text("Current HP")
                                .titleText()
                            Stepper("", value: $currentHP, in: 1...maxHP)
                                .labelsHidden()
                            Spacer()
                            Text("❤️\(currentHP)/\(maxHP)")
                                .bodyText()
                            Spacer()
                        } // end v1
                        .squareStyle()
                        
                        // MARK: top right square
                        VStack { // V2
                            Spacer()
                            Text("Spell/Skill Slots")
                                .titleText()
                            Stepper("", value: $availableSlots, in: 0...maxSlots)
                                .labelsHidden()
                            Spacer()
                            Text("\(availableSlots)/\(maxSlots)")
                                .bodyText()
                            Text(displaySlots())
                            Spacer()
                            
                        } // end v2
                        .squareStyle()
                    } // end H1
                    
                    // MARK: top rectangle
                    HStack { // H2
                        VStack { // V3
                            Text("Recovery rates")
                                .titleText()
                            HStack {
                                Spacer()
                                Text("\(hpRecRate) HP / 5 min")
                                    .bodyText()
                                    .padding()
                                Text("1 / \(slotRecRate) min")
                                    .bodyText()
                                    .padding()
                                Spacer()
                            }
                        } // end V3
                    } // end H2
                    .rectangleStyle()
                    
                    // MARK: middle rectangle
                        VStack { // V3
                            Text("Time to full recovery")
                                .titleText()
                                .padding()
                            
                            HStack {
                                Spacer()
                                
                                VStack {
                                    Text("HP gain: \(missingHP)")
                                        .bodyText()
                                    Text("\(recoverHP()) min")
                                        .bodyText()
                                }
                                Spacer()
                                VStack {
                                    Text("Slot gain: \(missingSlots)")
                                        .bodyText()
                                    Text("\(recoverSlots()) min")
                                        .bodyText()
                                }
                                Spacer()
                            }
                        } // end V3
                        .rectangleStyle()
                    
                    // MARK: bottom rectangle
                    HStack {
                        Spacer()
                        
                        VStack {
                            Text("Rest for:")
                                .titleText()
                            Text("\(restDuration) minutes")
                                .bodyText()
                            Spacer()
                            Text("HP +\(displayHPRecovered())")
                                .bodyText()
                            Text("Slots +\(displaySlotsRecovered())")
                                .bodyText()
                        }
                            .padding()
                            
                        Spacer()
                        VStack {
                            Stepper("", value: $restDuration, in: 0...maxRestMinutes, step: 5)
                                .labelsHidden()
                                .padding(.trailing, 60)
                            Button("Start Rest") {
                                
                            displayRestAlert = true
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.trailing, 60)
                            .alert("Resting", isPresented: $displayRestAlert) {
                                Button("End Rest Early") {
                                    /* this would be where we put
                                     code that we want to run to
                                     produce a partial HP/slot recovery */
                                }
                            }
                        }
                    }
                    .rectangleStyle()
                } // end outside VStack
            } // end background
            .navigationTitle("Recovery")
        } // end NavStack
    } // end contentView body
} // end contentView struct

#Preview {
    ContentView()
}

