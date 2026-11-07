//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Gunny on 11/6/26.
//

// views and modifiers: View composition

// ***** ALWAYS USE STRUCTS FOR YOUR VIEWS *****
// they are more efficient and hold far less data-taking values than classes.
// classes inherit all elements of data whether they use them or not.
// this causes classes to grow out of control as they gain all data from parents.

import SwiftUI

struct CapsuleText: View { // create new struct for making capsule button stype
    var text: String // expects string to be passed in at scturc callsite
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    } // these are all the modifiers that will be applied to new CapsuleText struct iterations
}

struct ContentView: View { // start of screen displaying content
    var body: some View {
        
        VStack(spacing: 10) { // new VStack
            CapsuleText(text: "First")
            /* makes a new CapsuleText instance, passing 'First' into struct.
             Applies all modifiers automatically per struct instructions */
            
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
        } /* this creates the same button while having to enter all of the modifiers into the content view area
           rather than calling it from the CapsuleText struct outside of it. */
    }
}
    

#Preview {
    ContentView()
}
