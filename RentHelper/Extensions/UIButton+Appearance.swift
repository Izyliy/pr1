//
//  UIButton+Appearance.swift
//  RentHelper
//
//  Created by Павел Грабчак on 22.05.2022.
//

import Foundation
import UIKit

enum ButtonStyle {
    case standart
    case disabled
    case textOnly
}

extension UIButton {
    func changeAppearance(to state: ButtonStyle) {
        layer.cornerRadius = 6.0
        titleLabel?.font = FontFamily.FiraSans.bold.font(size: 20)
        
        switch state {
        case .standart:
            setTitleColor(Asset.Colors.enabledButtonText.color, for: .normal)
            backgroundColor = Asset.Colors.enabledButtonBackground.color
        case .disabled:
            setTitleColor(Asset.Colors.disabledButtonText.color, for: .normal)
            backgroundColor = Asset.Colors.disabledButtonBackground.color
        case .textOnly:
            setTitleColor(Asset.Colors.enabledButtonBackground.color, for: .normal)
            backgroundColor = .clear
        }
    }
}
