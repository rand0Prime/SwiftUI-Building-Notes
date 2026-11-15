//
//  ContentView.swift
//  BetterRest
//
//  Created by Gunny on 11/13/26.
//

// topics: stepper, DatePicker, Working with Dates, import coreML

// tutorials from https://www.hackingwithswift.com/100/swiftui/27

import CoreML // allows for use of CoreML in project for SleepCalculator.mlmodel
import SwiftUI

struct ContentView: View {
    
    // state block
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    static var defaultWakeTime: Date {
    /* setting as static allows for wakeUp state variable to reference it
     before defaultWakeTime has been used; makes defaultWakeTime a part of
     ContentView struct */
        
        var components = DateComponents() // sets up variable to store date information
        components.hour = 7 // ties .hour to what hour in components variable is
        components.minute = 0 // ties .minute to what minute in components variable is
        return Calendar.current.date(from: components) ?? .now
        /* spits out current date using data from components variable, defaulting
         to the current date and time if for some reason components can't be read */
    }
    
    var body: some View {
        NavigationStack{
            Form { // sets up new form
                VStack(alignment: .leading, spacing: 0) { // groups first string and picker
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } // end first group
                
                VStack(alignment: .leading, spacing: 0) { // groups second string and picker
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } // end second group
                
                VStack(alignment: .leading, spacing: 0) { // groups third string and picker
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                } // end third group
            } // end form
            .navigationTitle("BetterRest  ")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
                // adds button to top right corner of screen which runs calculateBedtime func
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            } // adds alert with message which shows after hitting 'calculate'
        }
    }
    func calculateBedtime() {
        do { // set up block of code to execute, and allows for catch section for errors below)
            let config = MLModelConfiguration()
            // just in case further exploration is needed, but unlikely I will need this frequently
            let model = try SleepCalculator(configuration: config)
            /* sets up coreGL model and prepares it to run */
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            /* temp constant within just this do block, pulling .hour and .minute values
             from wakeUp state variable, which in turn is grabbing that info from
             the static defaultWakeTime variable */
            let hour = (components.hour ?? 0) * 60 * 60
            /* takes .hour value from temp components constant, setting default value
             to 0 and converts the hour value into seconds which is required to pass
             the value into the prediction model since the datapoints are in seconds */
            let minute = (components.minute ?? 0) * 60
            /* takes .minute value from temp components constant, setting default value
             to 0 and converts the hour value into seconds which is required to pass
             the value into the prediction model since the datapoints are in seconds */
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            /* wake, estimatedSleep, and coffee are parameters created by the model and each
             are titles to columns from the dataset document. They accept
             the Double(hour + minute) to create the total number of seconds of
             sleep the user prefers to get each night, sleepAmount and coffeeAmount to pass
             into the code which runs the actual calculations within the model */
            
            let sleepTime = wakeUp - prediction.actualSleep
            /* calculates the actual time for when the user should go to bed by subtracting the amount
             of seconds from the time they are wanting to wake up (also calculated as number of seconds
             after midnight */
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            // converts sleepTime into an actual time in format XX:XX AM
            
        } catch {
            
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
            /* assigns default values to alertTitle and alertMessage in case an error occurs
             when running the model to calculate sleepTime */
        }
        
        showingAlert = true
    }
    
}

#Preview {
    ContentView()
}
