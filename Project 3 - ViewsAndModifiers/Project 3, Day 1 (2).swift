// xcode: set sdk=iOS

//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Gunny on 11/6/26.
//

// views and modifiers: views as properties

// ***** ALWAYS USE STRUCTS FOR YOUR VIEWS *****
// they are more efficient and hold far less data-taking values than classes.
// classes inherit all elements of data whether they use them or not.
// this causes classes to grow out of control as they gain all data from parents.

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    /* creates state modifier for text color changing */
    
    var character1: some View {
        Text("Luthor")
    } /* since it is impossible to make a text field that's bound to a
       local property when they're both properties, this
       logic allows for a creative loophole */
    
    var spells: some View {
        VStack {
            Text("Bigby's Hand")
            Text("Fireball")
        }
    }
    /*  Even stacks can be set up as variables! */
    
    
    let character2 = Text("Frazil")
    // makes two constants containing a view as its property
    
    var body: some View {
        VStack {
            
            Spacer()
            
            character1
                .foregroundStyle(.red)
            character2
                .foregroundStyle(.blue)
            /* displays the text views stored in constants on screen.
             Modifiers can be applied to these constants as well since they are
             still views and can be used / manipulated as such */
            
            Spacer()
            
            spells
                .foregroundStyle(.green)
            /*  changes the text inside spells VStack to green */
            
            Spacer()
            
            Text("Paladin")
            Text("Necromancer")
            Text("Rogue")
            Text("Mage")
                .font(.subheadline)
            /* font applied to a view (like to this text view) takes priority over any
             environment modifiers of the matching type. This is why Mage gets set as
             smaller text than the other three text views above it in the same VStack */
            
            Spacer()
        }.font(.title)
        /* .font on the outside of the VStack is an environment modifier; as such
         it applies to everything within the VStack .*/
        
        Spacer()
        
        Button("Hello, World!") {
            useRedText.toggle()
            /* change state of useRedText boolean whenever the
             button is pressed*/
            
            
        }
        .foregroundStyle(useRedText ? .red : .blue)
        Spacer()
    }   /* changes text color based on the state of useRedText boolean:
         when useRedText is set to true, text color changes to .red,
         when useRedText is set to false, text color changes to .blue */
    
    
}

#Preview {
    ContentView()
}
