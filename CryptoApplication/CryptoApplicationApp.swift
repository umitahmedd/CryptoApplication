//
//  CryptoApplicationApp.swift
//  CryptoApplication
//
//  Created by mac on 13.12.2023.
//

import SwiftUI

@main
struct CryptoApplicationApp: App {
    @StateObject private var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
