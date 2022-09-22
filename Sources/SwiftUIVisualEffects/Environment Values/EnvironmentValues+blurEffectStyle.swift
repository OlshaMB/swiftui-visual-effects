/**
* SwiftUIVisualEffects
*/

import SwiftUI

extension EnvironmentValues {
	var blurEffectStyle: NSBlurEffect.Style {
		get {
			self[BlurEffectStyleKey.self]
		}
		set {
			self[BlurEffectStyleKey.self] = newValue
		}
	}
}
