//
//  ContentView.swift
//  Word Scramble
//
//  Created by Gunny on 11/23/26.
//

// Topic: Bundles

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

    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "thisfile", withExtension: "txt") {
        /* checks to see if the filename matches what is expected (can be
         a file - URLs are not only for use with websites!) */
            if let fileContents = try? String(Contentsof: fileURL) {
                // handles errors in case the file cannot be loaded
            }
        }
    }
}

#Preview {
    ContentView()
}
