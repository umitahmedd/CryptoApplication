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
            VStack(alignment: .leading, spacing: nil) {
                // Header
                homeHeader

                HStack {
                    Text("Coin")

                    Spacer()

                    if showPortfolio {
                        Text("Holdigns")
                            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

                        Spacer()
                    }

                    Text("Pirce")
                }
                .foregroundStyle(Color.crp.secondaryText)
                .font(.subheadline)
                .padding(.horizontal, 10)

                List {
                    if showPortfolio {
                        ForEach(viewModel.allCoins) { coin in
                            CoinRow(coin: coin, showHoldings: true)
                                .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        }

                        Text("Lorem ")

                            .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))

                        Text("Lorem ")
                            .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))

                        Text("Lorem ")
                            .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))

                    } else {
                        ForEach(viewModel.portfolioCoins) { coin in
                            CoinRow(coin: coin, showHoldings: false)
                                .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        }
                    }
                }
                .listStyle(.inset)
                .transition(.move(edge: .bottom))

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
