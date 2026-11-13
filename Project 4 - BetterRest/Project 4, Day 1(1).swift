// xcode: set sdk=iOS

//
//  ContentView.swift
//  BetterRest
//
//  Created by Gunny on 11/13/26.
//

// topics: stepper, DatePicker, Working with Dates
// tutorials from https://www.hackingwithswift.com/100/swiftui/26

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    // creates new state variable for date equal to current date
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        /* creates stepper block, binds input to state of sleepAmount
         with available values between 4 and 12, but not beyond them. when
         input is entered, value will change by 0.25 each tap.
         
         Adding .formatted() removes the excess 0s after the decimal point
         */
        
        DatePicker("Please enter a date", selection: $wakeUp)
        /* creates date picker which ties the user input to state of wakeUp */
        
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            // shows just hours and minutes
            .labelsHidden()
            /* hides label from display but still keeps it accessible for
             anyone using screen reader or accessibility features */
        
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
            // shows just the date
        
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
        /* creates an open-ended date range which makes all future dates
         available for user to select, but makes all past dates and times unavailable */
        
        Text(Date.now, format: .dateTime.hour().minute())
        // displays text on the screen from today in the format of hour and minute
        
        Text(Date.now, format: .dateTime.day().month().year())
        /* displays text on the screen from today in the format of day, month, year.
         ***** With this method, we are asking for the data, not arranging it ourselves;
         swift takes our request and formats it for us automatically based on user
        preference */
         
        Text(Date.now.formatted(date: .long, time: .shortened))
        // displays text on screen with longer month name and minimized time display
    }
    
    func exampleDates() { // this is the manual way to do it, don't default to this method
        let now = Date.now
        // defines constant as current date.time
        let tomorrow = Date.now.addingTimeInterval(86400)
        // creates constant for point in time 86400 sec later than now (~ 1 day) in the futre
        let range = now...tomorrow
        /* creates a constant which defines a range of time between now and 86400
         sec from now (~ 1 day range) */
    }
    
    func exampleDatesButEasier() { // this is the better way, default to doing it this way
        // use swift components to do all the date/time calculations automatically
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        /* sets date to be 8 AM on any given day, and sets backup option
         to be the current date/time vial nil coalescing */
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        /* sets a constant which holds the hour and minute of a given day. In
         this example, it is using the current date / time */
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        /* creates two constants derived from components constant, using the .hour
         and .minute elements to pull data and store separately. Uses nil coalescing
         to set backup options since swift wants them and is needy */
    }
    
}

#Preview {
    ContentView()
}
