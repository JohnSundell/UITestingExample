/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import Foundation

extension UserDefaults {
    var onboardingCompleted: Bool {
        get { return bool(forKey: #function) }
        set { setValue(newValue, forKey: #function) }
    }
}
