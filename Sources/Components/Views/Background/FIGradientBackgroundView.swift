//
//  FIGradientBackgroundView.swift
//  SwiftUIComponents
//
//  Created by krishna on 8/16/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FIGradientBackgroundView: View {
	var body: some View {
		Rectangle()
			.fill(
				LinearGradient(
					gradient: Gradient(
						stops: [
							.init(color: Color(red: 0.9, green: 0.4, blue: 0.2), location: 0.0155), // Orange
							.init(color: Color(red: 0.9, green: 0.6, blue: 0.3), location: 0.3943), // Peach
							.init(color: Color(red: 1.0, green: 0.8, blue: 0.5), location: 1.0257)  // Light orange
						]
					),
					startPoint: UnitPoint(x: 0.5, y: 0),
					endPoint: UnitPoint(x: 0.5, y: 1)
				)
			)
	}
}

struct GradientBackgroundView_Previews: PreviewProvider {
	static var previews: some View {
		FIGradientBackgroundView()
	}
}
