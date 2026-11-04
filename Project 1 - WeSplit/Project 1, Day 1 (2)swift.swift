// xcode: set sdk=iOS

//
//  ContentView.swift
//  WeSplit
//
//  Created by Gunther Hammel on 10/26/26.
//

/* ******SECTION TOPICS******
 @State, Button */

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    /* @State allows for variables sourced from within a struct to be maniplulated
     similar to how we need to use mutating func to update variables repated to
     a function.
     ****** @State is designed for simple properties that are stored in one view, so
     marking them as private is recommended by Apple to signal they are used and made
     only here. */
   
    var body: some View {
        Button("Tap Count: \(tapCount)") {
        /* creates a button with text, and inserts the current tapCount variable value */
            tapCount += 1
            /* increases tapCount by 1 */
        }
    }
}

#Preview {
/* This allows for the code to be drawn to the simulator window so we can see
 what the code is going to look like */
    ContentView()
}
