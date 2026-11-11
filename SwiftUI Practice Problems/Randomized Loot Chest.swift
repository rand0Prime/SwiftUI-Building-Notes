//
//  ContentView.swift
//  Loot Chest
//
//  Created by Gunny on 11/9/26.
//

/*
 This will let you practice custom modifiers, view composition, and conditional
 styling based on what you have learned up to Day 24.
 
 THE "LOOT CHEST" PRACTICE APP
 
 This app will simulate opening a treasure chest and revealing a
 random piece of loot with different rarities.
 
 PROBLEM 1: THE LOOT VIEW (VIEW COMPOSITION)
 Create a custom view called LootItemView that accepts a String for the item
 name and a String for the rarity (e.g., "Common", "Rare", "Epic"). It should
 display them together in a VStack.
 
 PROBLEM 2: THE RARITY MODIFIER (CUSTOM MODIFIERS)
 Create a custom view modifier called RarityStyle that changes the text color
 based on the rarity string passed into it.
 "Common" = Gray
 "Rare" = Blue
 "Epic" = Purple
 
 PROBLEM 3: THE LOOT GENERATOR (STATE & LOGIC)
 In your main ContentView, create a @State array of item names and a @State variable
 for the currently revealed item. Add a "Open Chest" button that randomly selects
 an item and a random rarity.
 
 PROBLEM 4: THE FINAL POLISH (VIEW EXTENSIONS)
 Create a View extension for your RarityStyle modifier so you can apply it easily
 to your LootItemView. Add a nice background gradient to the whole app to make it
 feel like a real game screen.
 */

import SwiftUI

// beginning of code blocks

enum itemRarity: String { // set rarity classes
    case common = "common"
    case rare = "rare"
    case epic = "epic"
    case mythic = "mythic"
    case blank = ""
}

struct LootItem { // template for new items
    var name: String
    var rarity: itemRarity
    /* uses enum as variable type for rarity
     which expects name and rarity parameters at
     callsite */
}

struct LootItemView: View { // start of template for item view area
    
    let name: String
    let rarity: itemRarity
    /* sets expectations for callsite when new loot item
     view is created */
    
    var body: some View {
        VStack { // space to display details about rewarded item
            Spacer()
            Text(name) // displays name of item (passed in from callsite)
                .rarityStyled(for: rarity)
                // applies custom modifier for text color based on rarity
            Spacer()
            Text(rarity.rawValue) // displays rarity of item (passed in from callsite)
                .rarityStyled(for: rarity)
            Spacer()
        }
        .frame(maxWidth: 350, maxHeight: 200)
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 20))
        .font(.title)
        .bold()
        .shadow(radius: 5)
        // applies changes to are of screen VStack occupies
    }
} // end of template for iem view area

func rarityTextColor(rarityOfItem: itemRarity) -> Color {
    switch rarityOfItem {
    case .blank: .white
    case .common: .green
    case .rare: .blue
    case .mythic: .orange
    case .epic: .purple
    } // sets up item rarity classification system
}

struct RarityStyle: ViewModifier {
    var rarityInput: itemRarity
    func body(content: Content) -> some View {
        content
            .foregroundStyle(rarityTextColor(rarityOfItem: rarityInput))
    } /* creates housing for function which applies color change
       of text based on item rarity */
}

extension View {
    func rarityStyled(for rarity: itemRarity) -> some View {
        modifier(RarityStyle(rarityInput: rarity))
    } // shortens RarityStyle to an extension on View
}
// end of code blocks

// start of content display
struct ContentView: View {
    @State private var lootPool = [ // loot table
        LootItem(name: "Broadsword", rarity: .common),
        LootItem(name: "Great Axe", rarity: .common),
        LootItem(name: "Diamond Dagger", rarity: .rare),
        LootItem(name: "Seraph's Blade", rarity: .epic),
        LootItem(name: "Lether Cap", rarity: .common),
        LootItem(name: "Bastion", rarity: .epic),
        LootItem(name: "Plated Armor", rarity: .common),
        LootItem(name: "Lether Cap", rarity: .common),
        LootItem(name: "Hide Armor", rarity: .common),
        LootItem(name: "Fireproof Robe", rarity: .rare),
        LootItem(name: "Sword of Heroes", rarity: .mythic),
        LootItem(name: "Scimitar", rarity: .common),
        LootItem(name: "Bow", rarity: .common),
        LootItem(name: "Greaves", rarity: .common),
        LootItem(name: "Belt", rarity: .common),
        LootItem(name: "Limitless Minor Healing Potion", rarity: .rare),
        LootItem(name: "Poison Arrows", rarity: .common),
        LootItem(name: "Sending Stone", rarity: .rare)
        ]
    
    @State private var rolledItemName = ""
    @State private var rolledItemRarity = itemRarity.blank
    // placeholders for state variables
    
    func shuffleLoot() { // randomizes loot table
        lootPool.shuffle()
    }
    
    var body: some View {
        ZStack { // background stack
            Image("treasure chest") // set image as background
            
            VStack {
                Button {
                    shuffleLoot()
                    rolledItemName = lootPool[0].name
                    rolledItemRarity = lootPool[0].rarity
                /* shuffles loot, then assigns name and rarity of first item
                  to state variables */
                } label: {
                    Text("Claim your loot")
                }
                .frame(maxWidth: 250, maxHeight: 100)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .foregroundStyle(.black)
                .font(.title)
                .bold()
                .shadow(radius: 5)
                // visual edits to button
                
                LootItemView(name: rolledItemName, rarity: rolledItemRarity)
                /* creates instance of VStack from struct, passes
                 state variables in as parameters to build the stack */
            }
        }
    }
}

#Preview {
    ContentView()
}
