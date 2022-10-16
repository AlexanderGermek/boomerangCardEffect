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

	var body: some View {
		GeometryReader {
			let size = $0.size

			ZStack {
				ForEach(cards) { card in
					Text(card.id)
				}

			}
			.frame(width: size.width, height: size.height)
		}
	}
}

//struct BoomerangCardView_Previews: PreviewProvider {
//	static var previews: some View {
//		BoomerangCardView()
//	}
//}
