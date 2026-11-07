//
//  ContentView.swift
//  Character Sheet
//
//  Created by Gunny on 11/6/26.
//

/* This will let you practice custom modifiers and view composition

THE "CHARACTER SHEET" PRACTICE APP

PROBLEM 1: THE STAT ROW (VIEW COMPOSITION)
Create a custom view called StatRow that accepts a String for the stat name
 and an Int for the value. It should display them side-by-side using an HStack.
                                                                
PROBLEM 2: THE "CARD" MODIFIER (CUSTOM MODIFIERS)
Create a custom view modifier called CardStyle that adds a background color,
 rounded corners, and a shadow. Apply this modifier to your StatRow view.
                                                                
PROBLEM 3: THE STAT LIST (BUILDING THE UI)
In your main ContentView, use a VStack to display three StatRow views
 (e.g., Strength, Dexterity, Intelligence). Wrap them in a NavigationStack with
 the title "Character Sheet".
                                                                
PROBLEM 4: THE LEVEL UP BUTTON (ADDING STATE)
Add a @State variable for "Level". Add a button at the bottom of the screen
 that increases the level by 1. Use your CardStyle modifier on the button to
 make it match the rest of your app. */

import SwiftUI

struct StatView: View { // new view factory: this is where views iterate from
    let statName: String
    let statScore: Int
    // defines constants to be used in view body
    var body: some View {
        HStack {
            Text("\(statName):")
            Text(statScore, format: .number)
        }   // builds template for what each iteration of the view will look like
    }
}

struct CardStyle: ViewModifier { // new view modifier factory
    func body(content: Content) -> some View { // takes in content (in this case, a view)
            content // places view here and applies all modifiers listed below
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(.ultraThinMaterial)
        .foregroundStyle(.secondary)
        .shadow(radius: 5)
        .cornerRadius(25)
    }
}

extension View { // new custom extension for View type.
    func applyStyle() -> some View { // generic function call returning some kind of view.
        modifier(CardStyle()) /* this command makes a new custom extension which runs
                               the code in the CardStyle struct */
    }
}

var strengthStat = StatView(statName: "Strength", statScore: 17)
var dexterityStat = StatView(statName: "Dexterity", statScore: 12)
var WisdomStat = StatView(statName: "Wisdom", statScore: 14)
// saves 3 views as variables

struct ContentView: View { // beginning of screen displaying content
    
    @State private var level = 1
    
    var body: some View {
        NavigationStack {
            ZStack { // Background ZStack
                LinearGradient(stops: [
                    .init(color: Color(red: 0.2, green: 0.3, blue: 0.5), location: 0.3),
                    .init(color: Color(red: 0.6, green: 0.1, blue: 0.5), location: 0.9)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack { // outermost VStack
                    strengthStat // HStack 1
                        .modifier(CardStyle())
                    /* calls all three of the stat views from CardStyle struct,
                     and applies the styling to each without having to type the code
                     from CardStyle struct repeatedly */
                    dexterityStat // HStack 2
                        .modifier(CardStyle())
                    // same note as strengthStat
                    WisdomStat // HStack 3
                        .applyStyle()
                    /* this uses the custom View extension created above with applyStyle function
                     instead of having to specify the .modifier modifier */
                    
                    HStack { // HStack 4
                        Text("Level: \(level)")
                            .applyStyle()
                        // creates a display of level which matches the stype of the other HStacks on screen
                        Button("Level up") {
                            level += 1
                        }
                        .applyStyle()
                        // creates a button which matches the stype of the other HStacks on screen
                    } // end HStack 4
                } // end outermost VStack
            } // end ZStack
            .navigationTitle("Character Sheet")
        } // end NavStack
    }
}

#Preview {
    ContentView()
}
