//
//  HomeView.swift
//  CryptoApplication
//
//  Created by mac on 13.12.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack {
            // Background
            Color.crp.background
                .ignoresSafeArea()

            // Content
            VStack {
                // Header
                homeHeader

                List {
                    ForEach(viewModel.allCoins) { coin in
                        CoinRow(coin: coin, showHoldings: true)
                    }
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}

extension HomeView {
    private var homeHeader: some View {
        VStack {
            HStack {
                CircleButton(iconName: showPortfolio ? "plus" : "info")
                    .animation(.none)
                    .background(
                        CircleButtonAnimation(animate: $showPortfolio)
                    )

                Spacer()

                Text(showPortfolio ? "Portfolio" : "Live Prices")
                    .foregroundStyle(Color.crp.accent)
                    .font(.headline)
                    .animation(.none)

                Spacer()

                CircleButton(
                    iconName: "chevron.right",
                    action: { withAnimation(.easeOut(duration: 0.5).delay(0)) { showPortfolio.toggle() } }
                )
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
            }
        }
    }
}
