//
//  ContentView.swift
//  AIChating
//
//  Created by Tirzaan on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    let text = "apple"
    
    var body: some View {
        Text("\(text.article(uppercased: true)) \(text)")
    }
}

#Preview {
    ContentView()
}
