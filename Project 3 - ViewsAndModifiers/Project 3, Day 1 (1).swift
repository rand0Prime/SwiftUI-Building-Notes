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
