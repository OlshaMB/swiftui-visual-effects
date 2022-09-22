/**
* SwiftNSVisualEffects
*/

import SwiftUI

extension EnvironmentValues {
	var vibrancyEffectStyle: NSVibrancyEffectStyle? {
		get {
			self[VibrancyEffectStyleKey.self]
		}
		set {
			self[VibrancyEffectStyleKey.self] = newValue
		}
	}
}
