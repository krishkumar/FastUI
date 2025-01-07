//
//  FITextStyle.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/6/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

extension Text {
	func FItextStyle(_ textStyle: FITextStyle) -> some View {
		self
			.baselineOffset(textStyle.baselineOffset)
			.tracking(textStyle.tracking)
			.textCase(textStyle.textCase)
			.font(textStyle.font)
			.lineSpacing(textStyle.lineSpacing)
			.padding(.vertical, textStyle.lineSpacing / 2)
	}
}

extension TextField {
	func FItextStyle(_ textStyle: FITextStyle) -> some View {
		self
			.font(textStyle.font)
			.lineSpacing(textStyle.lineSpacing)
	}
}

extension TextEditor {
	func FItextStyle(_ textStyle: FITextStyle) -> some View {
		self
			.font(textStyle.font)
			.lineSpacing(textStyle.lineSpacing)
	}
}

extension Label {
	func FItextStyle(_ textStyle: FITextStyle) -> some View {
		self
			.font(textStyle.font)
			.lineSpacing(textStyle.lineSpacing)
	}
}

enum FITextStyle: String, CaseIterable {
	case header3
	case header4
	case header5
	case header6
	case header7
	case subtitle4
	case subtitle5
	case body
	case bodySemiBold
	case smallBody
	case smallBodySemiBold
	case buttonSmall
	case buttonLarge
	case buttonXLarge

	/// Try to use `.textStyle(_ textStyle: TextStyle)` over `.font(_ font: Font?)`. Only use this if you can't set the TextStyle directly on the Text.
	var font: Font {
		.custom(fontName.rawValue, size: size)
	}

	var uiFont: UIFont? {
		.init(name: fontName.rawValue, size: size)
	}

	private var size: CGFloat {
		switch self {
		case .header3:
			return 30
		case .header4:
			return 24
		case .header5:
			return 18
		case .header6:
			return 11
		case .header7:
			return 12
		case .subtitle4:
			return 24
		case .subtitle5:
			return 20
		case .body, .bodySemiBold:
			return 16
		case .smallBody, .smallBodySemiBold:
			return 14
		case .buttonSmall:
			return 14
		case .buttonLarge:
			return 16
		case .buttonXLarge:
			return 18
		}
	}

	private var lineHeight: CGFloat {
		size * 1.3
	}

	fileprivate var lineSpacing: CGFloat {
		lineHeight - (uiFont?.lineHeight ?? size)
	}

	fileprivate var tracking: CGFloat {
		switch self {
		case .header3:
			return 0.72
		case .header4, .header5, .body, .bodySemiBold, .smallBodySemiBold, .buttonXLarge, .buttonLarge:
			return 0
		case .header6, .header7:
			return 2.2
		case .subtitle4, .subtitle5:
			return 0.4
		case .smallBody, .buttonSmall:
			return 0.28
		}
	}

	fileprivate var baselineOffset: CGFloat {
		0
	}

	fileprivate var textCase: Text.Case? {
		switch self {
		case .header6:
			return .uppercase
		default:
			return nil
		}
	}
	private var fontName: FontName {
		switch self {
		case .header4, .header5, .header7:
			return .bold
		case .header3, .header6, .subtitle4, .subtitle5, .bodySemiBold, .smallBodySemiBold, .buttonSmall, .buttonLarge, .buttonXLarge:
			return .semiBold
		case .body, .smallBody:
			return .medium
		}
	}

	enum FontName: String, CaseIterable {
		case bold = "Outfit-Bold"
		case semiBold = "Outfit-SemiBold"
		case medium = "Outfit-Medium"
		case regular = "Outfit-Regular"
	}
}

struct FITextStyle_Previews: PreviewProvider {
	static var previews: some View {
		VStack(alignment: .leading, spacing: FIConstants.UI.Padding.large) {
			Text("Header 4 - Bold")
				.FItextStyle(.header4)
			Text("Header 5 - Bold")
				.FItextStyle(.header5)
			Text("Header 6 - SemiBold")
				.FItextStyle(.header6)
			Text("Subtitle 5 - SemiBold")
				.FItextStyle(.subtitle5)
			Text("Body - Medium")
				.FItextStyle(.body)
			Text("Body Semi Bold - SemiBold")
				.FItextStyle(.bodySemiBold)
			Text("Small Body - Medium")
				.FItextStyle(.smallBody)
			Text("Button Small - SemiBold")
				.FItextStyle(.buttonSmall)
			Text("Button Large - SemiBold")
				.FItextStyle(.buttonLarge)
			Text("Button X-Large - SemiBold")
				.FItextStyle(.buttonXLarge)
		}
		.padding()
		.previewLayout(.sizeThatFits)
	}
}
