//
//  FISpinningLoaderView.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/6/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

private enum Layout {
	static let spinnerAnimationDuration = CGFloat(1)
	static let spinnerRotationDegree = CGFloat(-360)
	static let size = CGSize(width: 35, height: 35)
	static let endFraction = CGFloat(0.25)
	static let lineWidth = CGFloat(6)
}

struct FISpinningLoaderView: View {
	private let color: Color
	private let isClearBackground: Bool
	private let endFraction: CGFloat
	private let size: CGSize
	private let lineWidth: CGFloat
	@State private var isLoading = false

	init(
		color: Color = Color.blue,
		isClearBackground: Bool = false,
		endFraction: CGFloat = Layout.endFraction,
		size: CGSize = Layout.size,
		lineWidth: CGFloat = Layout.lineWidth
	) {
		self.color = color
		self.isClearBackground = isClearBackground
		self.endFraction = endFraction
		self.size = size
		self.lineWidth = lineWidth
	}

	var body: some View {
		ZStack {
			Circle()
				.stroke(
					isClearBackground ? .clear : color.opacity(0.3),
					style: .init(
						lineWidth: lineWidth,
						lineCap: .round
					)
				)

			Circle()
				.trim(from: .zero, to: endFraction)
				.stroke(
					color,
					style: .init(
						lineWidth: lineWidth,
						lineCap: .round
					)
				)
		}
		.frame(size: size)
		.rotationEffect(.degrees(isLoading ? 0 : Layout.spinnerRotationDegree), anchor: .center)
		.animation(
			Animation.linear(duration: Layout.spinnerAnimationDuration).repeatForever(autoreverses: false),
			value: isLoading
		)
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				isLoading = true
			}
		}
	}
}

struct SpinningLoaderView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			Button("") { }
				.buttonStyle(FIPrimaryButtonStyle(isLoading: true))

			FISpinningLoaderView()
				.padding()

			FISpinningLoaderView(
				color: Color.green,
				isClearBackground: true,
				endFraction: 0.75,
				size: CGSize(width: 44, height: 44)
			)
		}
	}
}
