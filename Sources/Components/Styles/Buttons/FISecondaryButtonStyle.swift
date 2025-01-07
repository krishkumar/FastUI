//
//  FISecondaryButtonStyle.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/10/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

struct FISecondaryButtonStyle: ButtonStyle {
	@Environment(\.isEnabled) private var isEnabled

	private let backgroundColor: Color
	private let foregroundColor: Color
	private let size: FIButtonViewModifier.Layout.Size
	private let shouldExpand: Bool
	private let isLoading: Bool

	init(
		backgroundColor: Color = Color.blue.opacity(0.5),
		foregroundColor: Color = Color.blue,
		size: FIButtonViewModifier.Layout.Size = .large,
		shouldExpand: Bool = true,
		isLoading: Bool = false
	) {
		self.backgroundColor = backgroundColor
		self.foregroundColor = foregroundColor
		self.size = size
		self.shouldExpand = shouldExpand
		self.isLoading = isLoading
	}

	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.modifier(
				FIButtonViewModifier(
					backgroundColor: backgroundColor,
					foregroundColor: foregroundColor,
					size: size,
					isLoading: isLoading,
					isPressed: configuration.isPressed,
					shouldExpand: shouldExpand
				)
			)
	}
}
