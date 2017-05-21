/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import XCTest

extension XCUIApplication {
    var isDisplayingOnboarding: Bool {
        return otherElements["onboardingView"].exists
    }
}
