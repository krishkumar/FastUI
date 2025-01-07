//
//  FITextButtonStyle.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/29/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FITextButtonStyle: ButtonStyle {
	@Environment(\.isEnabled) private var isEnabled

	private let foregroundColor: Color
	private let size: FIButtonViewModifier.Layout.Size
	private let isLoading: Bool

	init(
		foregroundColor: Color = Color.blue,
		size: FIButtonViewModifier.Layout.Size = .text,
		isLoading: Bool = false
	) {
		self.foregroundColor = foregroundColor
		self.size = size
		self.isLoading = isLoading
	}

	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.modifier(
				FIButtonViewModifier(
					backgroundColor: .clear,
					foregroundColor: foregroundColor,
					size: size,
					isLoading: isLoading,
					isPressed: configuration.isPressed,
					shouldExpand: false
				)
			)
	}
}
