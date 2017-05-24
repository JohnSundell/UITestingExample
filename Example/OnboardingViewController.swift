/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit

final class OnboardingViewController: UIViewController {
    var userDefaults = UserDefaults.standard
    private lazy var scrollView = UIScrollView()
    private lazy var pageViews = [PageView]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.accessibilityIdentifier = "onboardingView"

        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)

        let pageTitles = [
            "Welcome to my fantastic app",
            "It has so many great features",
            "I know you just want to use it, but hear me out pls",
            "All set!"
        ]

        var leadingAnchor = scrollView.leadingAnchor

        for (index, title) in pageTitles.enumerated() {
            let pageView = PageView()
            pageView.titleLabel.text = title
            pageView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(pageView)

            scrollView.activateConstraints(
                pageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                pageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                pageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                pageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            )

            pageViews.append(pageView)
            leadingAnchor = pageView.trailingAnchor

            if index == pageTitles.count - 1 {
                let doneButton = pageView.addDoneButton()
                doneButton.addTarget(self, action: #selector(handleDoneButtonTap), for: .touchUpInside)
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize.width = CGFloat(pageViews.count) * view.frame.width
    }
}

private extension OnboardingViewController {
    @objc func handleDoneButtonTap() {
        userDefaults.onboardingCompleted = true
        dismiss(animated: true)
    }
}

private extension OnboardingViewController {
    final class PageView: UIView {
        lazy var titleLabel: UILabel = self.makeTitleLabel()

        private func makeTitleLabel() -> UILabel {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)

            let margin = CGFloat(40)

            activateConstraints(
                label.topAnchor.constraint(equalTo: topAnchor, constant: margin),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
                label.widthAnchor.constraint(equalTo: widthAnchor, constant: margin * -2)
            )

            return label
        }

        func addDoneButton() -> UIButton {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Done", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.sizeToFit()
            addSubview(button)

            activateConstraints(
                button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            )

            return button
        }
    }
}

private extension UIView {
    func activateConstraints(_ constraints: NSLayoutConstraint...) {
        NSLayoutConstraint.activate(constraints)
    }
}
