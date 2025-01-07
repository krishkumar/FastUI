//
//  FIShareView.swift
//  SwiftUIComponents
//
//  Created by krishna on 6/1/24.
//  Copyright © 2024 MagicIve. All rights reserved.
//

import SwiftUI

struct FIShareView: View, Identifiable {
	let id: String
	let url: URL

	init(url: URL) {
		self.url = url
		id = url.absoluteString
	}

	var body: some View {
		if #available(iOS 16.0, *) {
			FIWrappedViewController {
				UIActivityViewController(activityItems: [url], applicationActivities: nil)
			}
			.presentationDetents([.medium])
		} else {
			FIWrappedViewController {
				UIActivityViewController(activityItems: [url], applicationActivities: nil)
			}
		}
	}
}
