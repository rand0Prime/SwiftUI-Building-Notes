//
//  ContentView.swift
//  Project 2
//
//  Created by Gunny on 10/30/26.
//

/* Topic: Alert messages, .cancel, message: */

// code in notes refer to this lesson: https://www.hackingwithswift.com/books/ios-swiftui/showing-alert-messages

import SwiftUI

struct ContentView: View {
    @State private var displayingAlert = false
    // sets up for the displayingAlert bool to be monitored by Swift
    
    var body: some View {
        Button("Show alert") {
        // creates button with text on it
            displayingAlert = true
            // when button is pressed, displayingAlert is toggled to true
        }
        
        .alert("important message!", isPresented: $displayingAlert) {
        /* creates an alert with text "important message!", and it set as part of
         a two-way binding to the value of displayingAlert, which means that
         once "Dismiss" is hit, the value of displayingAlert goes back to false */
         
            Button("Dismiss") { }
            /* makes button to dismiss the alert, and there is no code that gets ran
            when the button is pressed. tapping that button, as a side effect, is what
            ends up setting the value of displayingAlert back to false due to the
            two-way binding. */
            
            Button("Cancel", role: .cancel) { }
            // .cancel makes text slightly bolded (safe option)
            Button("Erase", role: .destructive) { }
            // .destructive makes text red
        } message: {
            // displays a subtext message on the alert.
            Text("Please review carefully")
        }
        
    }
}

#Preview {
    ContentView()
}
