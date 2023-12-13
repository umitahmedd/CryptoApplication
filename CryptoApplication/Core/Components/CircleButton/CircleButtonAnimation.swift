//
//  CircleButtonAnimation.swift
//  CryptoApplication
//
//  Created by mac on 13.12.2023.
//

import SwiftUI

struct CircleButtonAnimation: View {
    @Binding var animate: Bool
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .scaleEffect(animate ? 1 : 0)
                .opacity(animate ? 0 : 1)
        }
    }
}

#Preview {
    CircleButtonAnimation(animate: .constant(true))
}
