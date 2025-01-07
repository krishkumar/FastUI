//
//  FILoadingImageView.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/25/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FILoadingImageView: View {
	let height: CGFloat?

	init(height: CGFloat? = nil) {
		self.height = height
	}

	var body: some View {
		Color.blue.opacity(0.3)
			.frame(height: height)
			.cornerRadius(FIConstants.UI.cornerRadius)
			.shimmering()
	}
}

struct FILoadingImageView_Previews: PreviewProvider {
	static var previews: some View {
		FILoadingImageView()
			.frame(height: 178)
	}
}
