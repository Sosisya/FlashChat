//
//  LabelAnimation.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 13.03.2023.
//

import UIKit

private func animateWelcomeTitle(_ label: UILabel) {
    label.text = ""
    let animateTitle = "⚡️FlashChat"
    var charIndex = 0.0

    for letter in animateTitle {
        Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
            label.text?.append(letter)
        }
        charIndex += 1
    }
}
