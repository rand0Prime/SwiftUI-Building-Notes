//
//  ContentView.swift
//  Unit Converter
//
//  Created by Gunny on 10/29/26.
//

/* This app is a converter that will take a distance measured in either
 metric or imperial units and converts it to whatever output is desired */

import SwiftUI

struct ContentView: View {
    
    @State private var sourceUnit = "M"
    @State private var resultUnit = "FT"
    @State private var userInput: Double = 15
    @FocusState private var inputIsFocused: Bool
    // sets up the states for input/output distance unit types and user input value
    let unitOptions = ["MM", "CM", "M", "K", "IN", "FT","YD", "MI"]
    //bank of allowed measurement types
    var body: some View {
        NavigationStack(){
            
            Form {
                Section() {
                    Text("Select Input measurement type:")
                    Picker("", selection: $sourceUnit) {
                        //use state of sourceUnit for picked item
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                            //each item shows the text value of the corresponding array element
                        }
                    }.pickerStyle(.segmented)
                    // makes ths picker segmented
                    Text("Enter value to convert:")
                    //adds header text
                    TextField("enter value", value: $userInput, format: .number)
                    //adds greyed out default text
                        .keyboardType(.decimalPad)
                        //forces numeric keyboard
                        .focused($inputIsFocused)
                        //when entering here, inputIsFocused = true
                    
                    Text("Select output measurement type:")
                    Picker("", selection: $resultUnit) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text("\(userInput.formatted())\(sourceUnit) = \(conversion(unitIn: sourceUnit, unitOut: resultUnit).formatted()) \(resultUnit)")
                    //uses string interpolation calling values from each variable
                }
            }
            .navigationTitle("Converter")
            //gives the large header text at the top of the screen
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                    
                }
            }
        }
    }
    
    func conversion(unitIn: String, unitOut: String) -> Double {
        
        var reducedValue: Double = 0
        var outputValue: Double = 0
        
        switch unitIn {
            // reduces user input to milimeters
        case "MM": reducedValue = userInput
        case "CM": reducedValue = userInput * 10
        case "M": reducedValue = userInput * 1000
        case "K": reducedValue = userInput * 1_000_000
        case "IN": reducedValue = userInput * 25.4
        case "FT": reducedValue = userInput * 304.8
        case "YD": reducedValue = userInput * 914.4
        case "MI": reducedValue = userInput * 1_609_344
        default: reducedValue = userInput
        }
        
        switch unitOut { // converts milimeters to the desired output measurement
        case "MM": outputValue = reducedValue
        case "CM": outputValue = reducedValue / 10
        case "M": outputValue = reducedValue / 1000
        case "K": outputValue = reducedValue / 1_000_000
        case "IN": outputValue = reducedValue / 25.4
        case "FT": outputValue = reducedValue / 304.8
        case "YD": outputValue = reducedValue / 914.4
        case "MI": outputValue = reducedValue / 1_609_344
        default: outputValue = reducedValue
        }
        
        return outputValue
    }
}
#Preview {
    ContentView()
}
