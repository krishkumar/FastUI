//
//  FINavigationMultiLineTitleView.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/24/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

private enum Layout {
	static let titleSpacing = CGFloat(5)
}

struct FINavigationMultiLineTitleView: View {
	let title: String
	let titleID: String
	let subtitle: String
	let subtitleID: String

	init(title: String, titleID: String = "", subtitle: String, subtitleID: String = "") {
		self.title = title
		self.titleID = titleID
		self.subtitle = subtitle
		self.subtitleID = subtitleID
	}

	var body: some View {
		VStack(spacing: Layout.titleSpacing) {
			Text(title)
				.FItextStyle(.buttonXLarge)
				.lineLimit(1)
				.accessibilityIdentifier(titleID)
			Text(subtitle)
				.FItextStyle(.header6)
				.accessibilityIdentifier(subtitleID)
		}
	}
}
