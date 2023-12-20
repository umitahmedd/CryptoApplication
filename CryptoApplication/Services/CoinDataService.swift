//
//  Coins.swift
//  CryptoApplication
//
//  Created by mac on 16.12.2023.
//

import Combine
import Foundation
class CoinDataService {
   @Published var allCoins: [CoinModel] = []
   var coinSubscription: AnyCancellable?

   init() {
      getCoins()
   }

   private func getCoins() {
      guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
      else { print("urs is not valid"); return }

      coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
         .subscribe(on: DispatchQueue.global(qos: .default))
         .tryMap { output -> Data in

            guard let response = output.response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
               print("bad server response")

               throw URLError(.badServerResponse)
            }

            print("\(output.self)")

            return output.data
         }
         .receive(on: DispatchQueue.main)
         .decode(type: [CoinModel].self, decoder: JSONDecoder())
         .sink { completion in
            switch completion {
            case .finished:
               break
            case let .failure(error):
               print(error.localizedDescription)
            }
         } receiveValue: { [weak self] coinsData in
            print(coinsData)
            self?.allCoins = coinsData
            self?.coinSubscription?.cancel()
         }
   }
}
