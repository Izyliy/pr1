//
//  LoginElementsCreator.swift
//  RentHelper
//
//  Created by Павел Грабчак on 12.06.2022.
//

import UIKit

fileprivate enum textFieldStyle {
    case password
    case login
}

class LoginElementsCreator {
    func getTextField(title: String) -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.placeholder = title
        textField.borderStyle = .roundedRect
        
        return textField
    }
    
    func getButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Логин", for: .normal)
        button.changeAppearance(to: .standart)
        
        return button
    }
}
