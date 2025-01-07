//
//  FISeparator.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/15/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FISeparator: View {
	var body: some View {
		Color.black
			.frame(height: FIConstants.UI.Separator.height)
			.frame(maxWidth: .infinity)
	}
}

struct Separator_Previews: PreviewProvider {
	static var previews: some View {
		FISeparator()
	}
}
