//
//  FIDefaultTextField.swift
//  SwiftUIComponents
//
//  Created by krishna on 3/3/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI
import UIKit

@available(iOS 15.0, macOS 12.0, *)

private enum Layout {
	static let textFieldHeight = CGFloat(53)
	static let strokeWidth = CGFloat(1)
	static let errorIconSize = CGSize(width: 14, height: 14)
	static let activeStrokeColor = #colorLiteral(red: 0.784393847, green: 0.7843937278, blue: 0.7843937278, alpha: 1)
	static let inactiveStrokeColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8431372549, alpha: 1)
}

struct FIDefaultTextField: View {
	@Environment(\.isEnabled) private var isEnabled

	@FocusState private var isFocused: Bool
	@Binding private var text: String

	private let textFieldType: TextFieldType
	private let headerLabel: String?
	private let submitLabel: SubmitLabel
	private let shouldAutoFocus: Bool
	private let error: String?
	private let onCommit: (() -> Void)?
	private let onTextChanged: ((String) -> Void)?

	init(
		text: Binding<String>,
		textFieldType: TextFieldType,
		headerLabel: String? = nil,
		submitLabel: SubmitLabel = .return,
		shouldAutoFocus: Bool = true,
		error: String? = nil,
		onCommit: (() -> Void)? = nil,
		onTextChanged: ((String) -> Void)? = nil
	) {
		_text = text
		self.textFieldType = textFieldType
		self.headerLabel = headerLabel ?? textFieldType.header ?? ""
		self.submitLabel = submitLabel
		self.shouldAutoFocus = shouldAutoFocus
		self.error = error
		self.onCommit = onCommit
		self.onTextChanged = onTextChanged
	}

	var body: some View {
		VStack(alignment: .leading, spacing: FIConstants.UI.Padding.small) {
			if let headerLabel {
				Text(headerLabel)
					.FItextStyle(.smallBody)
					.foregroundColor(Color.black)
			}

			TextField(
				"",
				text: $text,
				onCommit: {
					onCommit?()
				}
			)
			.FItextStyle(.bodySemiBold)
			.focused($isFocused)
			.keyboardType(textFieldType.keyboardType)
			.textContentType(textFieldType.textContentType)
			.submitLabel(submitLabel)
			.autocorrectionDisabled()
			.foregroundColor(Color.black)
			.frame(maxWidth: CGFloat.infinity)
			.padding(FIConstants.UI.Padding.large)
			.frame(height: Layout.textFieldHeight)
			.background(backgroundView)
			.accessibilityElement(children: AccessibilityChildBehavior.contain)
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
					isFocused = shouldAutoFocus
				}
			}
			.onChange(of: text) { newValue in
				if
					case let .number(limit) = textFieldType,
					text.count <= limit,
					newValue.count > limit
				{
					self.text = text
					onTextChanged?(text)
				} else {
					onTextChanged?(newValue)
				}
			}

			if let error {
				FIErrorView(errorMessage: error, isToast: false)
			}
		}
	}

	private var backgroundView: some View {
		ZStack {
			RoundedRectangle(cornerRadius: FIConstants.UI.cornerRadius)
				.fill(isEnabled ? Color.white : Color.gray)
			RoundedRectangle(cornerRadius: FIConstants.UI.cornerRadius)
				.stroke(
					Color(
						text.isEmpty
						? Layout.inactiveStrokeColor
						: (error == nil ? Layout.activeStrokeColor : Layout.activeStrokeColor )
					),
					lineWidth: Layout.strokeWidth
				)
		}
	}
}

struct DefaultTextField_Previews: PreviewProvider {
	static var previews: some View {
		FIDefaultTextField(text: .constant(""), textFieldType: .email)
	}
}

enum TextFieldType {
	case email, phone, name, number(characterLimit: Int), text
}

extension TextFieldType {
	var keyboardType: UIKeyboardType {
		switch self {
		case .email:
			return .emailAddress
		case .phone:
			return .phonePad
		case .name:
			return .asciiCapable
		case .number:
			return .numberPad
		case .text:
			return .default
		}
	}

	var textContentType: UITextContentType {
		switch self {
		case .email:
			return .emailAddress
		case .phone:
			return .telephoneNumber
		case .name:
			return .name
		case .number:
			return .init(rawValue: "")
		case .text:
			return .init(rawValue: "")
		}
	}

	var header: String? {
		switch self {
		case .email:
			return "Email"
		case .phone:
			return "Phone"
		default:
			return nil
		}
	}
}
