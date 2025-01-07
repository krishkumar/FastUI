//
//  FINavigationLinkHelper.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/20/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

extension View {
	func segue<T, Destination: View>(
		to segueType: Binding<T?>,
		destination: @escaping (T) -> Destination
	) -> some View {
		modifier(
			FINavigationLinkHelper(
				segueType: segueType,
				destination: destination
			)
		)
	}
}

private struct FINavigationLinkHelper<T, Destination: View>: ViewModifier {
	@Binding var segueType: T?
	let destination: (T) -> Destination

	func body(content: Content) -> some View {
		content
			.background(
				NavigationLink(
					isActive: .init(
						get: { segueType != nil },
						set: { segueType = $0 ? segueType : nil }
					),
					destination: {
						if let viewModel = segueType {
							destination(viewModel)
						}
					},
					label: {
						EmptyView()
					}
				)
			)
	}
}
