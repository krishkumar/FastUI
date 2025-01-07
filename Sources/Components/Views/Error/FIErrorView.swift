//
//  FIErrorView.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/27/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

private enum Layout {
	static let backgroundColor = Color(#colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9098039216, alpha: 1))
	static let iconSize = CGSize(width: 20, height: 20)
}
struct FIErrorView: View {
	let errorMessage: String
	let isToast: Bool
	let tryAgainAction: (() -> Void)?

	init(
		errorMessage: String,
		isToast: Bool = true,
		tryAgainAction: (() -> Void)? = nil
	) {
		self.errorMessage = errorMessage
		self.isToast = isToast
		self.tryAgainAction = tryAgainAction
	}

	var body: some View {
		if isToast {
			HStack(alignment: .center, spacing: FIConstants.UI.Padding.small) {
				Text(errorMessage)
					.FItextStyle(.buttonLarge)
					.fixedSize(horizontal: false, vertical: true)
				Spacer()

				if let tryAgainAction {
					Button(
						action: tryAgainAction,
						label: {
							Text("Try Again")
								.underline()
								.FItextStyle(.buttonSmall)
						}
					)
				}
			}
			.foregroundColor(Color.red)
			.padding(FIConstants.UI.Padding.default)
			.background(Layout.backgroundColor)
			.cornerRadius(FIConstants.UI.cornerRadius)
		} else {
			HStack(spacing: FIConstants.UI.Padding.small) {
				Image(systemName: "exclamationmark")
					.resizable()
					.frame(size: FIConstants.UI.iconSize)
				Text(errorMessage)
					.FItextStyle(.smallBodySemiBold)
			}
			.foregroundColor(Color.red)
		}
	}
}

struct ErrorView_Previews: PreviewProvider {
	static var previews: some View {
		FIErrorView(errorMessage: "Failed loading data", tryAgainAction: {})
	}
}
