/**
* SwiftUIVisualEffects
*/

import SwiftUI

struct _BlurVisualEffectViewRepresentable: NSViewRepresentable {
	func makeNSView(context: Context) -> NSVisualEffectView {
		NSVisualEffectView(effect: NSBlurEffect(style: context.environment.blurEffectStyle))
	}
	
	func updateNSView(_ uiView: NSVisualEffectView, context: Context) {
		uiView.effect = NSBlurEffect(style: context.environment.blurEffectStyle)
	}
}
