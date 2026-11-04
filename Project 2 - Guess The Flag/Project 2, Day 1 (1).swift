// xcode: set sdk=iOS

//
//  ContentView.swift
//  Project 2
//
//  Created by Gunny on 10/30/26.


/* Topic: stacks, spacing, alignment, spacer  */

// code in notes refer to this lesson: https://www.hackingwithswift.com/books/ios-swiftui/using-stacks-to-arrange-views

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            //starts a horizontal stack
            Spacer()
            //adds room to the left of the HStack
            
            VStack(spacing: 20) {
            //starts a vertical stack (left column) inside the horizontal stack
                
                /* can add to parentheses for VStack things like (alighment: leading) or (alignment: trailing)
                 to have the text aligned left or right respectively.
                 
                 Can also add (spacing: X) to give more space between lines
                 
                 ***Swift will automatically fill the space with the content */
                
                Spacer()
                //adds a space between the top edge of the screen and the first item in the VStack
                Text("Upper left")
                Spacer()
                //adds a space between the first and second item in the VStack
                Text("Left middle")
                Spacer()
                //adds a space between the second and third item in the VStack
                Text("Lower left")
                Spacer()
                //adds a space between the third item in the VStack and the bottom edge of the screen
            } //end of first vertical stack
            
            Spacer()
            //adds a space between the first VStack and second VStack
            
            VStack(spacing: 20) { //start of second (middle column) VStack
                Spacer()
                Text("Upper middle")
                Spacer()
                Text("center")
                Spacer()
                Text("Lower middle")
                Spacer()
            } //end of middle vertical stack
            
            Spacer()
            //adds a space between second and third VStacks
            
            VStack(spacing: 20) {
                Spacer()
                Text("Upper right")
                Spacer()
                Text("Right middle")
                Spacer()
                Text("Lower Right")
                Spacer()
            } //end of right vertical stack
            
            Spacer()
            //adds room to the right of the horizontal stack
        } // end of HStack
       
        
    }
}

#Preview {
    ContentView()
}
