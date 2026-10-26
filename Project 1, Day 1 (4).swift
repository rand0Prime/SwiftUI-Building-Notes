// xcode: set sdk=iOS

//
//  ContentView.swift
//  WeSplit
//
//  Created by Gunther Hammel on 10/26/26.
//

/* ******SECTION TOPICS******
 two-way binding, TextField, Text */

import SwiftUI

/* TOPICS
 
 ForEach, trailing closure syntax */

struct ContentView: View {
    @State private var name = ""
    /* makes an empty string to be used in code below, for important reasons. */
    
    var body: some View {
        Form {
            ForEach(0..<100) {
            /* creates a list of items for range mentioned as parameter.
             Very useful as a picker feature where we want to present user
             with a range of options to be selected*/
                Text("Row \($0)")
                /* determines the screen output to be displayed for each row.
                 Uses the $0 trailing closure syntax to print out the number
                 of the row for each iteration through the loop.*/
            }
        }
    }
}

#Preview {
    ContentView()
}
