//
//  UIButton+Appearance.swift
//  RentHelper
//
//  Created by Павел Грабчак on 22.05.2022.
//

import Foundation
import UIKit

extension UIButton {
    func enabledAppearance() {
        configAppearance()
        backgroundColor = Asset.Colors.enabledButton.color
    }
    
    func disabledAppearance() {
        configAppearance()
        backgroundColor = Asset.Colors.disabledButton.color
    }
    
    private func configAppearance() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8.0
        titleLabel?.font = FontFamily.FiraSans.regular.font(size: 20)
    }
}
