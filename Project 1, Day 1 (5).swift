// xcode: set sdk=iOS

//
//  ContentView.swift
//  WeSplit
//
//  Created by Gunther Hammel on 10/26/26.
//

import SwiftUI

/* TOPICS
 
 State, id: \.self, ForEach, Picker, Text, trailing closure */

struct ContentView: View {
    let members = ["Luthor", "Mavvius", "Nel"]
    /* makes an array of party members as Strings */
    /* members is a constant and will never change, so it does not
     need the @State in front of it */
    @State private var selectedMember = "Luthor"
    /* creates a state for selectedMember, using Luthor as the default*/
    
    
    var body: some View {
        NavigationStack {
        /* makes a new navigation window */
            Form {
            /*creates a new form */
                Picker("Select your party member", selection: $selectedMember) {
                /* fills the new form with a picker (dropdown window box
                 allowing for a selection of multiple items. In this case, the
                 default selection is the stored variable selectedMember,
                 and when a new choice is made it will be written in as the new
                 state for var selectedMember because of the $ in front of
                 the variable name (two-way binding)) */
                    ForEach(members, id: \.self) {
                    /* uses the elements within array members as avaialble
                     selections for the picker window, with each picker
                     option id being its own String as it is stored in the array */
                        Text($0)
                        /* for each element in the array numbers, show as text
                         the value stored in that location of the array - this
                         is what the $0 is telling Swift to do */
                    }
                }
            }
            .navigationTitle("Select A Party Member")
            /* gives a header title to the navigationStack */
        }
    }
}

#Preview {
    ContentView()
}
