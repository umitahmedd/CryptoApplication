//
//  ContentView.swift
//  CryptoApplication
//
//  Created by mac on 13.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.crp.background
                .ignoresSafeArea()

            VStack {
                Text("Accent Color")
                    .foregroundStyle(Color.crp.accent)
                    .font(.headline)

                Text("Secondary Text")
                    .foregroundStyle(Color.crp.secondaryText)
                    .font(.headline)

                Text("Red Color")
                    .foregroundStyle(Color.crp.red)
                    .font(.headline)

                Text("Green Color")
                    .foregroundStyle(Color.crp.green)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView()
}
