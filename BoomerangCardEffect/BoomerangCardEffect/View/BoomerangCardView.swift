//
//  BoomerangCardView.swift
//  BoomerangCardEffect
//
//  Created by Alexander Germek on 16.10.2022.
//

import SwiftUI

struct BoomerangCardView: View {
	var isBlurEnabled = false
	var isRotationEnabled = true
	@Binding var cards: [Card]

	@State var offset: CGFloat = 0
	@State var currentIndex: Int = 0

	var body: some View {
		GeometryReader {
			let size = $0.size

			ZStack {
				ForEach(cards.reversed()) { card in
					CardView(card: card, size: size)
					/// Moving card
						.offset(y: currentIndex == indexOf(card: card) ? offset : 0)
				}
			}
			.animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: offset == .zero)
			.frame(width: size.width, height: size.height)
			.contentShape(Rectangle())
			.gesture(
				DragGesture(minimumDistance: 2)
					.onChanged(gestureOnChanged(value:))
					.onEnded(gestureOnEnded(value:))
			)
		}
	}

	func gestureOnChanged(value: DragGesture.Value) {
		offset = value.translation.height
	}

	func gestureOnEnded(value: DragGesture.Value) {
		var translation = value.translation.height
		translation = translation < 0 ? -translation : 0

		if translation > 110 {
			withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
				cards[currentIndex].isRotated = true
				cards[currentIndex].extraOffset = -350
				cards[currentIndex].scale = 0.7
			}
		} else {
			offset = .zero
		}
	}

	@ViewBuilder
	func CardView(card: Card, size: CGSize) -> some View {
		let index = indexOf(card: card)
		Image(card.imageName)
			.resizable()
			.aspectRatio(contentMode: .fill)
			.frame(width: size.width, height: size.height)
			.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
			.scaleEffect(scaleFor(value: index), anchor: .top)
			.offset(y: -offsetFor(value: index))
	}

	func scaleFor(value: Int) -> Double {
		let index = Double(value)
		if index > 3 {
			return 8
		}

		return 1 - (index / 15)
	}

	func offsetFor(value: Int) -> Double {
		let index = Double(value)
		if index > 3 {
			return 30
		}

		return index * 10
	}

	func indexOf(card: Card) -> Int {
		if let index = cards.firstIndex(where: { arrayCard in
			arrayCard.id == card.id
		}) {
			return index
		}

		return 0
	}
}
