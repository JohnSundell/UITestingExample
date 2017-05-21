/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?) -> Bool {
        if CommandLine.arguments.contains("--uitesting") {
            resetState()
        }

        let mainVC = MainViewController()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = mainVC
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}

private extension AppDelegate {
    func resetState() {
        let defaultsName = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: defaultsName)
    }
}
