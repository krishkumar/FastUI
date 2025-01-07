//
//  FITertiaryButtonStyle.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/24/23.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FITertiaryButtonStyle: ButtonStyle {
	@Environment(\.isEnabled) private var isEnabled

	private let backgroundColor: Color
	private let foregroundColor: Color
	private let strokeColor: Color
	private let size: FIButtonViewModifier.Layout.Size
	private let shouldExpand: Bool
	private let isLoading: Bool

	init(
		backgroundColor: Color = .clear,
		foregroundColor: Color = Color.white,
		strokeColor: Color = Color.white,
		size: FIButtonViewModifier.Layout.Size = .small,
		shouldExpand: Bool = false,
		isLoading: Bool = false
	) {
		self.backgroundColor = backgroundColor
		self.foregroundColor = foregroundColor
		self.strokeColor = strokeColor
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
					strokeColor: strokeColor,
					size: size,
					isLoading: isLoading,
					isPressed: configuration.isPressed,
					shouldExpand: shouldExpand
				)
			)
	}
}
