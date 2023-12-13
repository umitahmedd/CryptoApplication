//
//  CircleButton.swift
//  CryptoApplication
//
//  Created by mac on 13.12.2023.
//

import SwiftUI

struct CircleButton: View {
    let iconName: String
    var action: (() -> Void)?
    var body: some View {
        Button {
            // Check Action
            if let action = action {
                action()

            } else {
                // Default action when nil
                print("no action")
            }

        } label: {
            // Icon
            Image(systemName: iconName != "" ? "\(iconName)" : "heart.fill")
                .font(.headline)
                .foregroundColor(Color.crp.accent)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .foregroundColor(Color.crp.background)
                )
                .shadow(color: Color.crp.accent.opacity(0.20), radius: 5, x: 0, y: 0)
                .padding()
        }
    }
}

#Preview {
    CircleButton(iconName: "info", action: { print("lorem ipsum dolor sit amet") })
}
