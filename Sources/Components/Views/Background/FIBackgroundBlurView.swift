//
//  FIBackgroundBlurView.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/27/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

struct FIBackgroundBlurView: UIViewRepresentable {
	func makeUIView(context: Context) -> UIView {
		let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
		view.backgroundColor = .clear
		return view
	}

	func updateUIView(_ uiView: UIView, context: Context) {}
}
