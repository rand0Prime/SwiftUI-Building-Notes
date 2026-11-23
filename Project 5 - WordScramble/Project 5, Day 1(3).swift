//
//  ContentView.swift
//  Word Scramble
//
//  Created by Gunny on 11/23/26.
//

// Topic: Working with strings

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func testStrings() {
        let input = "a b c" // new string of letters separated by a space
        let letters = input.components(separatedBy: " ")
        /* new varable creating an array of strings with each element
         being a string of letters separated by the spaces */
        // result would be [a, b c]
        
        let input2 = """
            a
            b
            c
            """
        // new string of letters separated by line break (return key)
        
        let letters2 = input2.components(separatedBy: "\n")
        // new array of strings separated by line break (return key)
        // result would be [a, b, c]
        
        let letter = letters.randomElement()
        /* creates new constant with value randomly assigned as an
        element from letters array. */
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        /* removes white space and return lines from string.
         ? tells swift to check and see if there is a string
         in the letter constant first */
    }
    
    func testStrings2() {
        let word = "cleric"
        let checker = UITextChecker()
        /* calls a checker from UIKit to be used in Swift
         without having to load all the rest of UIKit framework */
       
        let range = NSRange(location: 0, length: word.utf16.count)
        /* creates a new constant tells Objective-C style UITextChecker how to read the length of our word
         made in swift */
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        /* tells checker how to look at the string and specifies
         a few different conditions */
        
        let allGood = misspelledRange.location == NSNotFound
        /* tells checker what to do if the word does not contain spelling errors */
    }
    
}

#Preview {
    ContentView()
}
