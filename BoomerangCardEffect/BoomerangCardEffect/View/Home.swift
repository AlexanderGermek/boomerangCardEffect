//
//  Home.swift
//  BoomerangCardEffect
//
//  Created by Alexander Germek on 16.10.2022.
//

import SwiftUI

struct Home: View {
	// MARK: States
	@State var cards: [Card] = []
	@State var isBlurEnabled = false
	@State var isRotationEnabled = true

	var body: some View {
		VStack(spacing: 20) {
			Toggle("Enable Blur", isOn: $isBlurEnabled)
			Toggle("Turn On Rotation", isOn: $isRotationEnabled)
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

			BoomerangCardView(isBlurEnabled: isBlurEnabled, isRotationEnabled: isRotationEnabled, cards: $cards)
				.frame(height: 220)
				.padding(.horizontal, 15)

		}
		.padding(15)
		.background {
			Color(#colorLiteral(red: 0.1294117868, green: 0.1294117868, blue: 0.1294117868, alpha: 1))
				.ignoresSafeArea()
		}
		.preferredColorScheme(.dark)
		.onAppear(perform: setupCards)
	}

	// MARK: Private functions
	private func setupCards() {
		for i in 2...4 {
			cards.append(.init(imageName: "card\(i)"))
		}

		/// For infinitive cards
		if var first = cards.first {
			first.id = UUID().uuidString
			cards.append(first)
		}
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
