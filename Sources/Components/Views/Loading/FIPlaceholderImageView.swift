//
//  FIPlaceholderImageView.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/25/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

private enum Layout {
	static let backgroundColor = Color(#colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9607843137, alpha: 1))
	static let padding = CGFloat(10)
	static let size = CGSize(width: 80, height: 80)
}
struct FIPlaceholderImageView: View {
	let shouldExpand: Bool

	var body: some View {
		if shouldExpand {
			Image(systemName: "photo")
				.resizable()
				.scaledToFit()
				.padding(Layout.padding)
				.background(Layout.backgroundColor)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.cornerRadius(FIConstants.UI.cornerRadius)
		} else {
			Image(systemName: "photo")
				.resizable()
				.frame(size: Layout.size)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Layout.backgroundColor)
		}
	}
}

struct PlaceholderImageView_Previews: PreviewProvider {
	static var previews: some View {
		FIPlaceholderImageView(shouldExpand: true)
			.frame(size: CGSize(width: 100, height: 100))
		FIPlaceholderImageView(shouldExpand: false)
			.frame(size: CGSize(width: 350, height: 180))
	}
}
