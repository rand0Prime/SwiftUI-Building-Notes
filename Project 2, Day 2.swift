// xcode: set sdk=iOS

//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Gunny on 10/31/26.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
        // randomizes the array each time it is countries.shuffled is called
    @State private var correctAnswer = Int.random(in: 0...2)
    // sets the correct answer to be a random flag out of 3 shown flags
    
    @State private var showingScore = false
    /* sets a new state which tracks whether or note
     user's score is currently being displayed */
    @State private var scoreTitle = ""
    // sets up a message to be displayed to show user's score
    
    var body: some View {
        
        ZStack {
            LinearGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.9, green: 0.4, blue: 0.2), location: 0.5)
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        /* Makes a ZStack for putting things on top of things,
         makes the back stack a gradient and tells the color
         to ignore the safe area, which colors all the way to the edges
         of the disoplay */
            
            VStack {
                Spacer()
                /* 1 of 4 spacers used to help make the
                 app look nice on all sizes of screens */
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                /* game title font at top of screen */
                
                VStack(spacing: 15) {
                    // gives spacing around flags to make it look nicer on screen
                    VStack {
                        /* creates stack explaining rules to user */
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            // lets some of the background color show through for text color
                            .font(.subheadline.weight(.heavy))
                        /* turns the text (the foreground item) white
                         and makes adjustments to font styling */
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        // calls correct answer from countries array
                        // makes adjustments to font styling
                    }// end of rules VStack
                    
                    // beginning of main body VStack
                    ForEach(0..<3) { number in
                        /* makesa a for block using three random flags, one of which
                         is the correct answer */
                        Button {
                            // Flag was tapped
                            flagTapped(number)
                            /* sets up button to track which number flag is tapped
                             and compare it against the correct answer*/
                        } label: {
                            Image(countries[number])
                            // sets the button image to be the country's flag
                                .clipShape(.capsule)
                            // masks the flag into a rounded oval shape
                                .shadow(radius: 5)
                            // applies shadow to the button
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                // stretches a frame edge to edge horizontally aroung flags
                .padding(.vertical, 40)
                // extends frame vertically slightly
                .background(.thinMaterial)
                // makes the frame a little more seethrough
                .clipShape(.rect(cornerRadius: 30))
                // rounds the edges of the frame
                
                Spacer()
                Spacer()
                /* 2 of 4 spacers used to help make the
                 app look nice on all sizes of screens */
                
                Text("Your Score: ???")
                .foregroundStyle(.white)
                .font(.title.bold())
                /* displays score at bottom of screen */
                
                Spacer()
                /* 1 of 4 spacers used to help make the
                 app look nice on all sizes of screens */
            }
            .padding()
            // applies padding to outermost VStack to help with screen optimization
            
        } // end of ZStack
        .alert(scoreTitle, isPresented: $showingScore) {
        /* creates an alert which displays scoreTitle when showingScore is updated */
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
            /* creates button within alert which says "Continue",
             shows a message displaying current score and calls the
             askQuestion method when "Continue" button is tapped*/
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            
            
            /* updates scoreTitle if user taps flag matching randomly chosen
             correctAnswer value */
        } else {
            scoreTitle = "Wrong"
            /* updates scoreTitle if user taps flag that does not match correctAnswer */
        }
        showingScore = true
        // sets showingScore bool to true
    }
    
    func askQuestion() {
        countries.shuffle()
        // shuffles countries array
        correctAnswer = Int.random(in: 0...2)
        /* randomly assigns correctAnswer to one of the first 3 flags in
        countries array after it has been shuffled */
    }
    
    
    
}

#Preview {
    ContentView()
}
