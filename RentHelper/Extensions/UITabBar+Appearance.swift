//
//  UITabBar+Appearance.swift
//  RentHelper
//
//  Created by Павел Грабчак on 08.04.2022.
//

import UIKit

extension UITabBarController {
    func becomeDefault() {
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .white
//        tabBar.layer.cornerRadius = 25
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.04
    }
}
