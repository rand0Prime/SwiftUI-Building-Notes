// xcode: set sdk=iOS

//
//  ContentView.swift
//  Project 2
//
//  Created by Gunny on 10/30/26.


/* Topic: ZStack, colors, frames, .background, background custom colors, .ignoreSafeArea, padding, ultraThinMaterial */

// code in notes refer to this lesson: https://www.hackingwithswift.com/books/ios-swiftui/colors-and-frames

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
        //makes new ZStack (used for overlapping items)
            Color.secondary
            /* fills entire space with slightly transparent black to
             give some shading abilities to other colors
             
             ** this Color.secondary could also be written as Color.colorName
             (red, blue, green, purple, etc
             - in the event we were to write the color in that way, we wound
             remove the .background line of code from line 32
             
             Can also make customer colors with the following syntax -
             Color(red: 1, green: 0.8, blue: 0)
             to tell swift to mix ratios of each of the RGB colors
             */
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                /* gives restrictions for which area of the screen should have
                 the green background. */
            Text("Backgrounds and colors!")
                .foregroundStyle(.secondary)
                //makes slightly transluscent
                .padding(50)
                //expands the effect of the foregroundStyle for text
                .background(.ultraThinMaterial)
                //applies some frosted  glass / blurring to this text window
                
                
        }
        .background(.green)
        /* applies green color to entire screen, but the .frame line above
        trims the background to fill only the designated area*/
        .ignoresSafeArea()
        /* tells swift to ignore the upper and lower horizontal limits
         of the safe area when filling the screen with the background
         color. IMPORTANT: make sure all user-interactive elements of
         your code live and are visible in the safe area, otherwise
         there will be issues with getting to those items (might be behind clock,
         dynamic island, home line at bottom of screen etc) */
        
    }
}

#Preview {
    ContentView()
}
