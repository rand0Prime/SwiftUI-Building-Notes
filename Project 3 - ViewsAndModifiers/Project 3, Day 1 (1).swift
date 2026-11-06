//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Gunny on 11/6/26.
//

// views and modifiers

// ***** ALWAYS USE STRUCTS FOR YOUR VIEWS *****
// they are more efficient and hold far less data-taking values than classes.
// classes inherit all elements of data whether they use them or not.
// this causes classes to grow out of control as they gain all data from parents.

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("I do nothing") {
                // does nothing
            }
            .frame(maxWidth: 200, maxHeight: 200)
            .background(.green)
            /* order of these modifiers matters; it will do the top item first, then
             any that are below it. This means that in order for the background to fill
             the 200x200 frame, the frame modifier must come first and then the
             background color. If the background color was first, it would only highlight
             the text of the button, and would not fill the 200x200 frame. */
        }
        .frame (maxWidth: .infinity, maxHeight:  .infinity)
        .background(.purple)
        /* There is nothing behind our view, so if we want to have the background
         of our entire screen be a certain color, we modify our outermost VStack
         with maxWidth and maxHeight set to infinity. */
        
       
    }
}

#Preview {
    ContentView()
}
