//
//  FIButtonStyle.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/24/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FIButtonStyle_Previews: PreviewProvider {
	static var previews: some View {
		VStack(alignment: .center, spacing: FIConstants.UI.Padding.large) {
			Button("TextButtonStyle") {}
				.buttonStyle(FITextButtonStyle())
			Button("DefaultButtonStyle") {}
				.buttonStyle(DefaultButtonStyle())
			Button("PrimaryButtonStyle") {}
				.buttonStyle(FIPrimaryButtonStyle())
			Button("") {}
				.buttonStyle(FIPrimaryButtonStyle(isLoading: true))
			Button("SecondaryButtonStyle") {}
				.buttonStyle(FISecondaryButtonStyle())
			Button("") {}
				.buttonStyle(FISecondaryButtonStyle(isLoading: true))
			Button("TertiaryButtonStyle") {}
				.buttonStyle(FITertiaryButtonStyle())
			Button("") {}
				.buttonStyle(FITertiaryButtonStyle(isLoading: true))
		}
		.padding()
		.previewLayout(.sizeThatFits)
		.background(Color.white)
	}
}
