//
//  Card.swift
//  BoomerangCardEffect
//
//  Created by Alexander Germek on 16.10.2022.
//

import Foundation

/// Card Model
struct Card: Identifiable {
	var id: String = UUID().uuidString
	var imageName: String
	var isRotated: Bool = false
	var extraOffset: CGFloat = 0
	var scale: CGFloat = 1
	var zIndex: Double = 0
}
