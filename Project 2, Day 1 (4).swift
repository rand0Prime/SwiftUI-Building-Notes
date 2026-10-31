//
//  ContentView.swift
//  Project 2
//
//  Created by Gunny on 10/30/26.
//

/* Topic: buttons, buttonStyle, destructive, bordered, custom buttons, images */

// code in notes refer to this lesson: https://www.hackingwithswift.com/books/ios-swiftui/buttons-and-images

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        Button("Press the button...") {
        /*makes a button with this text inside of it,
        and starts a closure for what happens when the button
        is pressed. */
            
            print("You pressed the button!")
            //this is the code that runs from the closure on press
            
        }
        
        Button("Press this other button...", role: .destructive, action: displayMessage)
        /* makes another button which runs a function called
        by the action command from within the button parentheses.
         ** this function is stored outside the bottom of the view body
         
         .destructive turns the text red, to be used for marking a button
         as dangerous */
        
        Button("Button 1") { }
        
        Button("Button 2", role: .destructive) { }
            .buttonStyle(.bordered)
        // gives a background to the button
        
        Button("Button 3") { }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .foregroundStyle(.black)
        /* makes the background more pronounced and changes the
        color of the button border, while changing the text to be black */
        
        Button("Button 4", role: .destructive) { }
            .buttonStyle(.borderedProminent)
        // makes the destructive button bordered and more pronounced
        
        Button {
        // makes a custom button
            print("You're good at button-presssing!")
            // tells the button what to do when it is pressed
        } label: {
            // starts section for entering in descriptive info about the button
            Text("Tap me...")
            // this is what the button displays on it
                .padding()
                // makes the 'button' area larger (really it expands the space around the text)
                .foregroundStyle(.black)
                // makes the text black
                .background(.purple)
                // makes the 'button' purple
        }
        
        Image(systemName: "pencil.circle")
        // adds an image to the display with filename matching string
        
        /* There is a whole catalog of icons that can be used in xcode when
         building apps. Free catalog downloadable: https://developer.apple.com/sf-symbols/ */
        
        Image(decorative: "cat")
        // adds an image from assets catalogto the display with filename matching string.
        // the decorative bit keeps the image from being read out on things like VoiceOver
            .resizable()
            // allows for the image to be resized
            .scaledToFit()
            // keeps the image from getting squished by other elements
            .frame(minWidth: 100, maxWidth: 250, maxHeight: 200)
            // gives the image dimensions to occupy
        
        Button("Save", systemImage: "externaldrive.fill.badge.plus") {
            // creates custom button using system image as tappable item
            print("Saving...")
        }
        
        Button {
            print("Doing the thing...")
        } label: {
            Label("Save", systemImage: "externaldrive.fill.badge.plus")
        /* another way of doing the same thing as the previous button,
         but this gives the ability to further customize/format the button */
                .padding()
                // gives space around text of button
                .foregroundStyle(.white)
                // turns text white
                .background(.blue.gradient)
                // gives button color a subtle gradient
            }
    }
}

#Preview {
    ContentView()
}
func displayMessage() {
    print("You pressed this one too!")
}
