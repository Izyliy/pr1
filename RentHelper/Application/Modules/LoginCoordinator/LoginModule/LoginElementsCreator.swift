//
//  LoginElementsCreator.swift
//  RentHelper
//
//  Created by Павел Грабчак on 12.06.2022.
//

import UIKit

class LoginElementsCreator {
    func getLogoView() -> UIImageView {
        let view = UIImageView()
        view.image = Asset.Images.loginLogo.image
        
        return view
    }
    
    func getLoginTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.placeholder = "Логин"
        textField.borderStyle = .roundedRect
        textField.font = FontFamily.FiraSans.regular.font(size: 20)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        
        return textField
    }
    
    func getPasswordTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.font = FontFamily.FiraSans.regular.font(size: 20)
        textField.isSecureTextEntry = true
        
        return textField
    }
    
    func getLoginButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Логин", for: .normal)
        button.changeAppearance(to: .standart)
        button.setPressingAnimation()
        
        return button
    }
    
    func getRegisterButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Пройти регистрацию", for: .normal)
        button.changeAppearance(to: .textOnly)
        button.setPressingAnimation()
        
        return button
    }
    
    func getStackView() -> UIStackView {
        let stackView = UIStackView()
        return stackView
    }
}
