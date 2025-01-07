//
//  FIHideNavigationBarModifier.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/28/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

private struct FIHideNavigationBarModifier: ViewModifier {
	func body(content: Content) -> some View {
		if #available(iOS 16.0, *) {
			content
				.navigationTitle("")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar(.hidden)
		} else {
			content
				.navigationBarTitle("")
				.navigationBarHidden(true)
		}
	}
}

extension View {
	func hideNavigationBar() -> some View {
		modifier(FIHideNavigationBarModifier())
	}
}
