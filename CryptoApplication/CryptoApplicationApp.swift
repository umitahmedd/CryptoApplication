//
//  CryptoApplicationApp.swift
//  CryptoApplication
//
//  Created by mac on 13.12.2023.
//

import SwiftUI

@main
struct CryptoApplicationApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
