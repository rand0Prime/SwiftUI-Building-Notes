// xcode: set sdk=iOS

//
//  ContentView.swift
//  WeSplit
//
//  Created by Gunther Hammel on 10/26/26.
//

import SwiftUI

/* TOPICS

 @State, focusState, pickerStyle, .toolbar, segmented picker, .navigationLink, NavigationStack, Locale, keyboardType, Picker, TextField, value, two-way binding, format: .currency, section header text

 */

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    /* sets default values for three values that
     are expected to accept input from user during
     app usage. It will auto-update the values as changes are made.
     Each of these have a sensible starting
     value */
    @FocusState private var amountIsFocused: Bool
    /*  this will help with hiding the keyboard later in the code;
    we are telling Swift that the user currently has this variable focused
     if true */
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    // calculates the math required to return the amount per person for the check
    
    var body: some View {
        /* this is the start of the screen drawing section where
         we are determining what will show on the display */
        NavigationStack {
            /* Allows new views to slide in from left or right as
             user enters into or exits out of forms */
            Form {
                Section {
                    /* makes a new section inside of a new form */
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    /* adds a text field to this section, tying the value that
                     will be drawn to the screen to be equal to the checkAmount
                     variable by adding the $ in front of the variable name. Since
                     TextField likes to only have strings typed into it, we can
                     weasel our way into making swift happy by using format: .currency
                     and tell Swift to use that input type instead of typing an Int.
                     
                     after code:, this line of code checks the current locale of the
                     user, checks to see if there is a currency tied to that region,
                     and if thereis then it uses that currency type, otherwise it defaults
                     to USD
                     
                     the .keyboard extension forces the numberpad keyboard to show
                     instead of the text keyboard.
                     
                     the .focused extension toggles amountIsFocused to be true
                     */
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                            /* creates a picker (dropdown menu) in this section which
                             updates the state of the variable numberOfPeople to be whatever
                             the user selects. The picker will have options for 2 - 99
                             people, and uses string interpolation to print the element value
                             of the range iterated through ForEach */
                        }
                    }
                    .pickerStyle(.navigationLink)
                    // tells Swift to go to a new screen and list available options for this picker
                }
                
                Section("How much would you like to tip?") {
                    /* adding  text to parentheses after the section line adds the text as a subtitle
                     for the section*/
                    Picker("Tip percentage", selection: $tipPercentage) {
                    // new picker in a new section
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                            /* uses the values in array tipPercentages (id = the
                            actual values foe each element of the array) and
                             draws text on the screen using each of those values listed as
                             % amounts */
                        }
                    }
                    .pickerStyle(.segmented)
                    /* tells the tip percentage picker to be a horizontal bar of segmented values */
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            // gives navigation stack a title at top left corner of display for first page
            // *** Important include this line INSIDE the navigation stack instead of outside of it
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
            /* creates a toolbar item to the navigation stack. If user has the amount field
             selected and is typing into the field, there will be a "Done" button in the top
             right corner of the screen. When the button gets pressed, amountIsFocused changes
             back to false, which dismisses the done button and the keyboard */
                    }
                }
            }
            
        }
            }
}

#Preview {
    ContentView()
}
