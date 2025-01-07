//
//  FIWrappedView.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/12/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

struct FIWrappedView<T: UIView>: UIViewRepresentable {
	let factory: () -> T

	init(_ factory: @escaping () -> T) {
		self.factory = factory
	}

	func makeUIView(context: Context) -> T {
		factory()
	}

	func updateUIView(_ uiView: T, context: Context) {
	}
}
