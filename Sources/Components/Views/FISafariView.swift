//
//  FISafariView.swift
//  SwiftUIComponents
//
//  Created by krishna on 4/7/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SafariServices
import SwiftUI

struct FISafariView: UIViewControllerRepresentable, Identifiable {
	let id: String
	let url: URL

	init(url: URL) {
		self.url = url
		id = url.absoluteString
	}

	func makeUIViewController(context: UIViewControllerRepresentableContext<FISafariView>) -> SFSafariViewController {
		let configuration = SFSafariViewController.Configuration()
		configuration.barCollapsingEnabled = false
		return SFSafariViewController(url: url, configuration: configuration)
	}

	func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<FISafariView>) {}
}
