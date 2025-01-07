//
//  FIShadowViewModifier.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/14/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

struct FIShadowViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.shadow(
				color: FIConstants.UI.Shadow.color,
				radius: FIConstants.UI.Shadow.radius,
				x: FIConstants.UI.Shadow.x,
				y: FIConstants.UI.Shadow.y
			)
	}
}

extension View {
	func shadow() -> some View {
		modifier(FIShadowViewModifier())
	}
}
