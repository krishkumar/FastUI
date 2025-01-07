//
//  FILottieView.swift
//  SwiftUIComponents
//
//  Created by krishna on 2/24/23.
//  Copyright © 2024 MagicIve. All rights reserved.
//

//import Foundation
//import Lottie
//import SwiftUI
//
//struct FILottieView: UIViewRepresentable {
//	let fileName: String
//	let loopMode: Lottie.LottieLoopMode
//	let autoPlay: Bool
//
//	init(fileName: String, loopMode: Lottie.LottieLoopMode = .loop, autoPlay: Bool = true) {
//		self.fileName = fileName
//		self.loopMode = loopMode
//		self.autoPlay = autoPlay
//	}
//
//	func makeUIView(context: Context) -> UIView {
//		let animationView = LottieAnimationView()
//		let animation = LottieAnimation.named(fileName)
//		animationView.animation = animation
//		animationView.contentMode = .scaleAspectFit
//		animationView.loopMode = loopMode
//		if autoPlay {
//			animationView.play()
//		}
//
//		let view = UIView()
//		view.addSubview(animationView)
//		animationView.translatesAutoresizingMaskIntoConstraints = false
//		NSLayoutConstraint.activate([
//			animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//			animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//		])
//		return view
//	}
//
//	func updateUIView(_ uiView: UIView, context: Context) {}
//}
