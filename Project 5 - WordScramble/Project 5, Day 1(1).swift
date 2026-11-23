//
//  ContentView.swift
//  Word Scramble
//
//  Created by Gunny on 11/23/26.
//

// Topics: List

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        List { // makes a scrolling list of enclosed content
            Text("Luthor")
            Text("Frazil")
            Text("OneWord")
            Text("Bek")
        }
        
        List { // new list
            
            Section("First Party") { // creates break in List form with header title
                Text ("NPC 1")
                Text ("NPC 2")
            }
            
            Section("Second Party") { // makes another break
                ForEach(1..<5) { // makes loop for list items to follow
                    Text("Player \($0)") // inserts element of range via $0
                }
            }
            Section("Third Party") { // another break
                Text ("NPC 3")
                Text ("NPC 4")
            }
        }
        /* can mix list by using static rows (like NPC 1/2 which have
         fixed values) and dynamic rows (such as the ones created by the
         ForEach loop for player numbers */
        .listStyle(.grouped) // extends list form edges to width .infinity
        
        List(0..<3) {
            Text("Spell level \($0)")
        } /* if a list is made of only dynamic content, the ForEach range
           can be added directly to the List line in parentheses to create the
           list with the range values passed into where the $0 lives */
        
        let party = ["Mavvius", "Bjöl", "Indigo", "Korryn"]
        List(party, id: \.self) { Text($0) }
        /* makes list which references array 'party' and creates an entry
         for each element in the array, using that element to tell Swift the text
         to display */
    }
}

#Preview {
    ContentView()
}
