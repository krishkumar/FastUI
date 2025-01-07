//
//  FINavigationBarView.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/15/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FINavigationBarView<TitleView: View, LeadingView: View, TrailingView: View>: View {
	private let titleView: TitleView
	private let leadingView: LeadingView
	private let trailingView: TrailingView
	private let backgroundColor: Color
	private let roundCorners: Bool
	private let displayShadow: Bool

	init(
		@ViewBuilder titleView: @escaping () -> TitleView = { Spacer() },
		@ViewBuilder leadingView: @escaping () -> LeadingView = { Spacer() },
		@ViewBuilder trailingView: @escaping () -> TrailingView = { Spacer() },
		backgroundColor: Color = FIConstants.UI.NavigationBar.backgroundColor,
		roundCorners: Bool = true,
		displayShadow: Bool = false
	) {
		self.titleView = titleView()
		self.leadingView = leadingView()
		self.trailingView = trailingView()
		self.backgroundColor = backgroundColor
		self.roundCorners = roundCorners
		self.displayShadow = displayShadow
	}

	var body: some View {
		HStack {
			leadingView
				.frame(maxWidth: .infinity, alignment: .leading)
			titleView
				.layoutPriority(1)
				.lineLimit(1)
			trailingView
				.frame(maxWidth: .infinity, alignment: .trailing)
		}
		.foregroundColor(Color.white)
		.padding(.horizontal, FIConstants.UI.Padding.default)
		.padding(.bottom, FIConstants.UI.Padding.large)
		.frame(height: FIConstants.UI.NavigationBar.height)
		.background(
			backgroundColor
				.cornerRadius(radius: roundCorners ? FIConstants.UI.cornerRadius : 0, corners: [.bottomLeft, .bottomRight])
				.edgesIgnoringSafeArea([.top])
				.shadow(
					color: FIConstants.UI.Shadow.color.opacity(displayShadow ? 1 : 0),
					radius: FIConstants.UI.Shadow.radius,
					x: FIConstants.UI.Shadow.x,
					y: FIConstants.UI.Shadow.y
				)
		)
	}
}

struct NavigationBarView_Previews: PreviewProvider {
	static var previews: some View {
		FINavigationBarView(
			leadingView: {
				Image(systemName: "arrowshape.turn.up.backward")
					.renderingMode(.template)
					.foregroundColor(Color.blue)
			},
			trailingView: {
				EmptyView()
			},
			backgroundColor: .white
		)
		.previewLayout(.sizeThatFits)
	}
}

struct NavigationBarButton: View {
	private let foregroundColor: Color
	private let backgroundColor: Color
	private let image: Image
	private let action: () -> Void

	init(
		foregroundColor: Color = Color.white,
		backgroundColor: Color = Color.blue,
		image: Image,
		action: @escaping () -> Void
	) {
		self.foregroundColor = foregroundColor
		self.backgroundColor = backgroundColor
		self.image = image
		self.action = action
	}

	var body: some View {
		Button(
			action: action,
			label: {
				ZStack {
					backgroundColor
						.cornerRadius()
					image
						.renderingMode(.template)
						.foregroundColor(foregroundColor)
				}
				.frame(size: FIConstants.UI.NavigationBar.buttonSize)
			}
		)
	}
}
