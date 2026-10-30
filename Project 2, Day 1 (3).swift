// xcode: set sdk=iOS

//
//  ContentView.swift
//  Project 2
//
//  Created by Gunny on 10/30/26.
//

/* Topic: Gradients (linear, radial, angular/conic) */

// code in notes refer to this lesson: https://www.hackingwithswift.com/books/ios-swiftui/gradients

import SwiftUI

struct ContentView: View {
    var body: some View {
        /* defaults to a VStack, meaning that all of these gradients
         which would, on their own, take up the entirety of the screen
         will take up an equal portion of the display, as calculated
         by swift for us */
        
        LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom)
        /* makes a background covering the safe area with colors listed in
         an array, with designated start and end points */
        
        LinearGradient(stops: [
            .init(color: .purple, location: 0.20),
            .init(color: .red, location: 0.90)
        ], startPoint: .top, endPoint: .bottom)
       
        
        /* this array makes a sharper contrast in the colors, beginning to
         mix into red 20% from the top of the screen, with red starting to
         take over around 90% from the top of the screen, and tells the gradient to
         start from the top of the screen while ending at the bottom */
        
        RadialGradient(colors: [.orange, .black, .purple], center: .center, startRadius: 20, endRadius: 200)
        /* makes a radial gradiant centered on the middle of the screen, expanding outward
         based on the start/end radii values entered */
        
        AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .red], center: .center)
        /* makes a sweeping gradient with center point on middle of screen,
         with colors changing on a line from center of screen to edge of device,
         changing from left to right */
        
        Text("Gradients are rad")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // creates a screenwide frame for this text element
            .foregroundStyle(.orange)
            // turns the foreground (in this case, the text) orange
            .background(.indigo
                .gradient)
            // applies an indigo background with a very subtle indigo gradient
    
    }
}

#Preview {
    ContentView()
}
