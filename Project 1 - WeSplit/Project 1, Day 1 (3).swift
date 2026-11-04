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

struct ContentView: View {
    @State private var name = ""
    /* makes an empty string to be used in code below, for important reasons. */
   
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            /* creates a blank text field with prompt "enter your name.
             the $ symbol in front of name indicates two-way binding, which means
             that swiftUI will know to both read and write changes to the variable
             in real time as they are made. This is necessary for any variable
             we want to be able to use, reuse, update, and have changes reflected
             throughout our code */
            Text("Your name is \(name)")
        }   /* displays text in new space, with variable name being added as it
             is typed - in real time thanks to two-way binding - by the user*/
    }
}

#Preview {
    ContentView()
}
