//
//  HomeViewModel.swift
//  CryptoApplication
//
//  Created by mac on 15.12.2023.
//

import Combine
import Foundation
class HomeViewModel: ObservableObject {
   @Published var allCoins: [CoinModel] = []
   @Published var portfolioCoins: [CoinModel] = []
   var cancellables = Set<AnyCancellable>()
   private let dataService = CoinDataService()

   init() {
      dataService.$allCoins
         .sink { [weak self] coinsData in
            self?.allCoins = coinsData
         }
         .store(in: &cancellables)
   }
}
