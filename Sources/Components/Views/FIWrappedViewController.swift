//
//  FIWrappedViewController.swift
//  SwiftUIComponents
//
//  Created by krishna on 4/21/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

struct FIWrappedViewController<T: UIViewController>: UIViewControllerRepresentable {
	let factory: () -> T

	init(_ factory: @escaping () -> T) {
		self.factory = factory
	}

	func makeUIViewController(context: Context) -> T {
		factory()
	}

	func updateUIViewController(_ uiViewController: T, context: Context) {
	}
}
