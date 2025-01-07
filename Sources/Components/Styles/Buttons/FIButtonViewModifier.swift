//
//  FIButtonViewModifier.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/8/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

struct FIButtonViewModifier: ViewModifier {
	@Environment(\.isEnabled) private var isEnabled

	private let backgroundColor: Color
	private let foregroundColor: Color
	private let strokeColor: Color
	private let size: Layout.Size
	private let isLoading: Bool
	private let isPressed: Bool
	private let shouldExpand: Bool

	init(
		backgroundColor: Color,
		foregroundColor: Color,
		strokeColor: Color = .clear,
		size: Layout.Size = .large,
		isLoading: Bool = false,
		isPressed: Bool,
		shouldExpand: Bool = true
	) {
		self.backgroundColor = backgroundColor
		self.foregroundColor = foregroundColor
		self.strokeColor = strokeColor
		self.size = size
		self.isLoading = isLoading
		self.isPressed = isPressed
		self.shouldExpand = shouldExpand
	}

	func body(content: Content) -> some View {
		ZStack {
			if isLoading {
				FISpinningLoaderView(
					color: foregroundColor,
					size: Layout.loaderSize,
					lineWidth: Layout.loaderLineWidth
				)
			}
			content
				.font(size.font)
				.opacity(isLoading ? 0 : 1)
		}
		.padding(size.textPadding)
		.foregroundColor(foregroundColor)
		.frame(maxWidth: shouldExpand ? .infinity : nil)
		.background(
			ZStack {
				RoundedRectangle(cornerRadius: Layout.cornerRadius)
					.fill(strokeColor != .clear ? .clear : backgroundColor)
				RoundedRectangle(cornerRadius: Layout.cornerRadius)
					.stroke(
						strokeColor,
						lineWidth: Layout.strokeWidth
					)
			}
		)
		.opacity(isEnabled ? (isPressed ? Layout.pressedOpacity : 1) : Layout.disabledOpacity)
		.contentShape(Rectangle())
		.animation(.easeInOut, value: isLoading)
	}
}

extension FIButtonViewModifier {
	enum Layout {
		static let cornerRadius = CGFloat(40)
		static let disabledOpacity = CGFloat(0.5)
		static let pressedOpacity = CGFloat(0.7)
		static let strokeWidth = CGFloat(2)
	}
}

extension FIButtonViewModifier.Layout {
	enum Size {
		case small
		case large
		case text

		var textPadding: EdgeInsets {
			switch self {
			case .large:
				return EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)
			case .small:
				return EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
			case .text:
				return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
			}
		}

		var font: Font {
			switch self {
			case .large:
				return FITextStyle.buttonXLarge.font
			case .small:
				return FITextStyle.buttonSmall.font
			case .text:
				return FITextStyle.buttonLarge.font
			}
		}
	}
	static let loaderSize = CGSize(width: 24, height: 24)
	static let loaderLineWidth = CGFloat(4)
}
