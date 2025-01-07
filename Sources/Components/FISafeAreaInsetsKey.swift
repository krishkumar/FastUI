//
//  FISafeAreaInsetsKey.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/21/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
	var safeAreaInsets: EdgeInsets {
		self[FISafeAreaInsetsKey.self]
	}
}

private struct FISafeAreaInsetsKey: EnvironmentKey {
	static var defaultValue: EdgeInsets {
		let insets = UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
		return EdgeInsets(top: insets.top, leading: insets.left, bottom: insets.bottom, trailing: insets.right)
	}
}
