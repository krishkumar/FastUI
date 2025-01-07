//
//  FIPageIndexView.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/12/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

private enum Layout {
	static let circleSize = CGSize(width: 8, height: 8)
	static let circleSpacing = FIConstants.UI.Padding.small
	static let borderWidth = CGFloat(2)
	static let strokeColor = Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1))
}

struct FIPageIndexView: View {
	private let numberOfPages: Int
	private let currentIndex: Int?
	private let fillColor: Color
	private let strokeColor: Color

	init(
		numberOfPages: Int,
		currentIndex: Int?,
		fillColor: Color = Color.black,
		strokeColor: Color = Layout.strokeColor
	) {
		self.numberOfPages = numberOfPages
		self.currentIndex = currentIndex
		self.fillColor = fillColor
		self.strokeColor = strokeColor
	}

	var body: some View {
		HStack(spacing: Layout.circleSpacing) {
			ForEach(0..<numberOfPages, id: \.self) { index in
				if index == currentIndex {
					Circle()
						.fill(fillColor)
						.frame(size: Layout.circleSize)
				} else {
					Circle()
						.strokeBorder(strokeColor, lineWidth: Layout.borderWidth)
						.frame(size: Layout.circleSize)
				}
			}
		}
	}
}

struct PageIndexView_Previews: PreviewProvider {
	static var previews: some View {
		FIPageIndexView(numberOfPages: 3, currentIndex: 0)
	}
}
