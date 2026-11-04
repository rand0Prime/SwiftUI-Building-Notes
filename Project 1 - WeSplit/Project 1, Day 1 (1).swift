// xcode: set sdk=iOS

//
//  ContentView.swift
//  WeSplit
//
//  Created by Gunther Hammel on 10/26/26.
//

/* ******SECTION TOPICS******
 app structure overview, ContentView, NavigationStack, Form, Section, 
 navigationTitle,navigationBarTitleDisplayMode, Preview */

import SwiftUI

struct ContentView: View {
    /* ContentView is the main struct that draws things to the screen */
    var body: some View {
        NavigationStack {
        /* Allows for our ConventView to be interacted with and scrolled so we don't
         have to constantly run the code to open the other preview from Device Hub */
            Form {
                /* Form is what creates the interactive items on the screen */
                
                Section{
                    /* Section creates the spaceer area beneath the last item in the group */
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            /* adds the title to the top of the screen output */
            .navigationBarTitleDisplayMode(.inline)
            /* makes the navigation bar title smaller and places it at the
             top center of the screen instead of having it be the default
             larger font on the left side of the screen */
        }
    }
}

#Preview {
/* This allows for the code to be drawn to the simulator window so we can see
 what the code is going to look like */
    ContentView()
}

/* ******SECTION TOPICS******
 app structure overview, ContentView, NavigationStack, Form, Section, navigationTitle,
 navigationBarTitleDisplayMode, Preview */


