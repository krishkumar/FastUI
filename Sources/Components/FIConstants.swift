//
//  Constants+.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/12/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI

enum FIConstants {
}

extension FIConstants {
	enum UI {
		static let cornerRadius = CGFloat(20.0)
		static let iconSize = CGSize(width: 24, height: 24)
		
		enum NavigationBar {
			static let height = CGFloat(56)
			static let buttonSize = CGSize(width: 40, height: 40)
			static let backgroundColor = Color.blue
		}
		enum Padding {
			static let `default` = CGFloat(20.0)
			static let extraLarge = CGFloat(24)
			static let large = CGFloat(16.0)
			static let small = CGFloat(8.0)
			static let screenBottom = CGFloat(10)
		}
		enum Separator {
			static let height = CGFloat(1)
		}
		enum Shadow {
			static let color = Color.black
			static let radius = CGFloat(12)
			static let x = CGFloat(0)
			static let y = CGFloat(10)
		}
		enum AnimationDuration {
			static let `default` = CGFloat(0.3)
			static let fast = CGFloat(0.15)
		}
	}	
}
