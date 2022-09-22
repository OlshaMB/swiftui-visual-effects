/**
* SwiftUIVisualEffects
*/

import SwiftUI

struct _VibrancyVisualEffectViewRepresentable<Content: View>: NSViewRepresentable {
	/// - Warning: `content`'s intrinsic content size will be lost.
	init(content: Content) {
		self.content = content
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(content: content)
	}
	
	func makeNSView(context: Context) -> NSVisualEffectView {
		context.coordinator.configureVisualEffectView(from: context)
		
		return context.coordinator.visualEffectView
	}
	
	func updateNSView(_ uiView: NSVisualEffectView, context: Context) {
		context.coordinator.configureVisualEffectView(from: context)
	}
	
	private let content: Content
}

extension _VibrancyVisualEffectViewRepresentable {
	final class Coordinator {
		let visualEffectView = NSVisualEffectView()
		
		init(content: Content) {
			let hostingController = NSHostingController(rootView: content)
			hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
			hostingController.view.backgroundColor = nil
			
			visualEffectView.contentView.addSubview(hostingController.view)
		}
		
		func configureVisualEffectView(from context: Context) {
			let blurEffect = NSBlurEffect(style: context.environment.blurEffectStyle)
			
			// Set `visualEffectView`'s `effect`.
			if let vibrancyEffectStyle = context.environment.vibrancyEffectStyle {
				visualEffectView.effect = NSVibrancyEffect(blurEffect: blurEffect, style: vibrancyEffectStyle)
			} else {
				visualEffectView.effect = NSVibrancyEffect(blurEffect: blurEffect)
			}
		}
	}
}
