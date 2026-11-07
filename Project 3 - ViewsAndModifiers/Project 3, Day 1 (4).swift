//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Gunny on 11/6/26.
//

// views and modifiers: Content, custom modifiers

// ***** ALWAYS USE STRUCTS FOR YOUR VIEWS *****
// they are more efficient and hold far less data-taking values than classes.
// classes inherit all elements of data whether they use them or not.
// this causes classes to grow out of control as they gain all data from parents.

import SwiftUI

struct Title: ViewModifier {
/* ex: we want to make the tiles in our app all look the same,
so rather than type out the code a bunch of times we make a struct
for the title formatting we wish to use repeatedly. This is called a view modifier  */
    
    func body(content: Content) -> some View {
        //  this line can be shortcut-entered by typing 'body' and selecting second option
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }  /* takes the Content from input and passes it into the func
        which in this case applies modifiers to it */
}

struct Watermark: ViewModifier { // makes a new view modifier struct to iterate from
    
    var text: String
    func body(content: Content) -> some View { /* type body, select second option; used since views are involved
                                                and we don't want to specify which type just yet */
        ZStack(alignment: .bottomTrailing) { // places in the bottom right area of view
            content
            /* makes new ZStack (stackable view) with the content passed into the
             struct at the callsite. */
            
            Text(text) // passes parameter text from callsite
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
                // applies modifiers to parameter text
        } // ZStack goes on top since it was last in line in function body
    }
}

extension View { // new extension on the view protocol
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
        // creates new modifier with the functions of the Watermark struct made above
    }
}

extension View { // creates an extension of the View protocol for us to use later
    func titleStyle() -> some View {
        modifier(Title())
    }/* creates a function within the extension which will run, as a modifier, the
      Title struct without having to type .modifier(insertStructNameHere())*/
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .modifier(Title())
                /* applies Title() function to the text view, which in this case
                 takes the content from the text field (the string), passes it
                 into the function called 'body', which takes the above content
                 and applies all the modifiers in the function to it */
            
            Text("Hello again!")
                .titleStyle()
                /* runs the same custom modifier as is run on Hello, World, but
                 without having to state that it is a modifier first thanks to
                 the extension made above */
            
            Text("This is intellectual property!")
                .titleStyle()
                .watermarked(with: "don't steal it")
            /* applies titlestyle and watermarked extensions  to text */
        }
    }
}

#Preview {
    ContentView()
}
