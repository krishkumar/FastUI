//
//  View+Extensions.swift
//  SwiftUIComponents
//
//  Created by krishna on 6/17/24.
//  Copyright © 2023 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

@available(iOS 15.0, *)
extension View {
	func cornerRadius(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) -> some View {
		clipShape(FIRoundedCorner(radius: radius, corners: corners))
	}
}

private struct FIRoundedCorner: Shape {
	let radius: CGFloat
	let corners: UIRectCorner

	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}

@available(iOS 15.0, *)
extension View {
	func frame(size: CGSize) -> some View {
		frame(width: size.width, height: size.height)
	}
}

@available(iOS 15.0, *)
extension View {
	func backgroundGradient(_ gradient: RadialGradient) -> some View {
		background(
			Rectangle()
				.fill(gradient)
		)
	}
}

@available(iOS 15.0, *)
extension View {
	@ViewBuilder func `ifDebug`<Content: View>(transform: (Self) -> Content) -> some View {
#if PRODUCTION
		self
#else
		transform(self)
#endif
	}
}
