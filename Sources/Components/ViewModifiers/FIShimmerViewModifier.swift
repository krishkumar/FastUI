//
//  FIShimmerViewModifier.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/24/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

private struct FIShimmer: ViewModifier {
	static let defaultAnimation = Animation.linear(duration: 1.5).repeatForever(autoreverses: false)

	let animation: Animation
	@State private var phase: CGFloat = 0

	init(animation: Animation = Self.defaultAnimation) {
		self.animation = animation
	}

	func body(content: Content) -> some View {
		content
			.modifier(
				AnimatedMask(phase: phase).animation(animation)
			)
			.onAppear { phase = 0.8 }
	}

	struct AnimatedMask: AnimatableModifier {
		var phase: CGFloat = 0

		var animatableData: CGFloat {
			get { phase }
			set { phase = newValue }
		}

		func body(content: Content) -> some View {
			content
				.mask(GradientMask(phase: phase).scaleEffect(3))
		}
	}

	/// A slanted, animatable gradient between transparent and opaque to use as mask.
	/// The `phase` parameter shifts the gradient, moving the opaque band.
	struct GradientMask: View {
		let phase: CGFloat
		let centerColor = Color.black
		let edgeColor = Color.black.opacity(0.7)
		@Environment(\.layoutDirection) private var layoutDirection

		var body: some View {
			let isRightToLeft = layoutDirection == .rightToLeft
			LinearGradient(
				gradient: Gradient(stops: [
					.init(color: edgeColor, location: phase),
					.init(color: centerColor, location: phase + 0.1),
					.init(color: edgeColor, location: phase + 0.2),
				]),
				startPoint: isRightToLeft ? .bottomTrailing : .topLeading,
				endPoint: isRightToLeft ? .topLeading : .bottomTrailing
			)
		}
	}
}

extension View {
	@ViewBuilder
	func shimmering(active: Bool = true, animation: Animation = FIShimmer.defaultAnimation) -> some View {
		if active {
			modifier(FIShimmer(animation: animation))
		} else {
			self
		}
	}
}
