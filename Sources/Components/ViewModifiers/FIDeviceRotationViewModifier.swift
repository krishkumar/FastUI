//
//  FIDeviceRotationViewModifier.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/24/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FIDeviceRotationViewModifier: ViewModifier {
	let action: (UIDeviceOrientation) -> Void

	func body(content: Content) -> some View {
		content
			.onAppear()
			.onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
				action(UIDevice.current.orientation)
			}
	}
}

extension View {
	func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
		self.modifier(FIDeviceRotationViewModifier(action: action))
	}
}

