/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit

final class MainViewController: UIViewController {
    var userDefaults = UserDefaults.standard

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard presentedViewController == nil else {
            return
        }

        if !userDefaults.onboardingCompleted {
            let onboardingVC = OnboardingViewController()
            present(onboardingVC, animated: false)
        }
    }
}

