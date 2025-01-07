//
//  FIPreferenceKeys.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/20/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FIFramePreferenceKey: PreferenceKey {
	static var defaultValue: CGRect = .zero
	static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}
