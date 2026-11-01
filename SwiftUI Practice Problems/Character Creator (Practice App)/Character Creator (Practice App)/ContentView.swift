//
//  ContentView.swift
//  Character Creator (Practice App)
//
//  Created by Gunny on 10/31/26.
//
/* THE "CHARACTER CREATOR" PRACTICE APP
Try to build these sequentially in a single SwiftUI view.
 
PROBLEM 1: THE LAYOUT (STACKS)
Create a layout with a large Text view at the top showing "Character Name",
 an Image (you can use a system image like "person.circle") in the middle,
 and a Button at the bottom. Use a VStack to stack them, and a ZStack
 to give the whole screen a background color.
 
PROBLEM 2: THE NAME INPUT (STATE & BINDINGS)
Add a @State variable for the character's name. Replace the static
 "Character Name" text with a TextField bound to your state variable.
 When you type in the text field, the title should update.
 
PROBLEM 3: THE CLASS PICKER (PICKERS)
Add a @State variable for a "Character Class" (e.g., Warrior, Mage, Rogue).
 Add a Picker that lets the user select one of these classes. Display the
 selected class below the character's name.
 
PROBLEM 4: THE LEVEL UP BUTTON (BUTTONS & MODIFIERS)
Add a @State integer for "Level" starting at 1. Style your bottom button
 to look like a "Level Up" button (give it a background color, rounded
 corners, and white text). When tapped, it should increase the level by 1.
 
PROBLEM 5: THE MAX LEVEL ALERT (ALERTS)
Add a boolean @State variable to control an alert. If the user tries to
 level up past level 5, do not increase the level; instead, show an alert
 that says "Max Level Reached!" */


import SwiftUI

struct ContentView: View {
    @State private var characterName = ""
    @State private var characterClass = "not selected"
    @State private var level = 1
    @State private var displayMaxLevelAlert = false
    // State variable bank
    
    let classes = ["Paladin", "Rogue", "Fighter", "Mage","Warlock", "Cleric", "Monk", "Druid"]
    // playable classes
    
    var body: some View {
       
            NavigationStack { // allows for transitions to new windows if wanted
                
                ZStack { // background color
                    LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    VStack { // outermost VStack for stacking grouped items
                        Spacer()
                        
                        VStack { // item group 1
                            Image(systemName: "person.circle")
                                .padding()
                            Text("Character Name: \(characterName)")
                                .font(.title2) // change font size to be slightly bigger
                            
                            TextField("Please enter your character's name", text: $characterName)
                            // two-way binding for characterName state
                                .padding(.leading, 25)
                                .padding()
                            Text("Class: \(characterClass)")
                            Text("Current Level: \(level)")
                            
                            Button { // level up button, can't go past 5
                                if level < 5 {
                                    level += 1
                                } else {
                                    displayMaxLevelAlert = true
                                } // displays alert message if trying to level up past 5
                            } label: {
                                Text("Level Up ⬆️")
                                    .frame(maxWidth: 150, maxHeight: 50) // body of button
                                    .foregroundStyle(.white) // text made white
                                    .background(.secondary) // color to button itself
                                    .clipShape(.capsule) // shape of button clipped from frame
                            }
                            .alert("Max level reached. You have learned all I can teach you...", isPresented: $displayMaxLevelAlert) {
                                Button("Fine...") { }
                            }
                        } // end of VStack for group 1 (name, class, level, level up button)
                        // below are edits made to VStack group 1
                        .frame(maxWidth: .infinity, maxHeight: 300) // background created
                        .background(.ultraThinMaterial) // background type
                        .clipShape(.rect(cornerRadius: 30)) // shapes the frame
                        .shadow(radius: 5) // light shading
                        Spacer()
                        
                        HStack{ // item group 2
                            Text("Select your class:")
                                .padding(.leading, 50)
                            Picker("", selection: $characterClass) { // picker for class
                                ForEach(classes, id: \.self) { // uses items from classes array
                                    Text($0) // shows each item from array as its own text object
                                }
                            }.pickerStyle(.wheel) // inline scroll to pick class
                        } // below are edits made to HStack, similar to item group 1
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 30))
                        .shadow(radius: 5)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        // these spacers apply dead space to bottom of screen
                    }
                }
            .navigationTitle("Character Builder")
                
        }
            
    }
}

#Preview {
    ContentView()
}
