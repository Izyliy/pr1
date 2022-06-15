//
//  LoginViewController.swift
//  myRent
//
//  Created by Павел Грабчак on 16.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let elementsCreator = LoginElementsCreator()

    var didSendEventClosure: ((LoginViewController.Event) -> Void)?

    private var loginButton: UIButton!
    private var registerButton: UIButton!
    private var loginTextField: UITextField!
    private var passwordTextField: UITextField!
    private var textFieldsStack: UIStackView!
    private var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField = elementsCreator.getLoginTextField()
        passwordTextField = elementsCreator.getPasswordTextField()
        loginButton = elementsCreator.getLoginButton()
        registerButton = elementsCreator.getRegisterButton()
        textFieldsStack = elementsCreator.getStackView()
        logoView = elementsCreator.getLogoView()
        
        setVisuals()
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
    
    func setVisuals() {
        view.backgroundColor = Asset.Colors.vcBackground.color
        
        setStackView()
        setConstraints()
    }
    
    func setStackView() {
        textFieldsStack.alignment = .fill
        textFieldsStack.distribution = .fillEqually
        textFieldsStack.spacing = 16.0
        textFieldsStack.axis = .vertical
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false

        textFieldsStack.addArrangedSubview(loginTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)
        
        view.addSubview(textFieldsStack)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(logoView)
    }
    
    func setConstraints() {
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(60).priority(.high)
            make.bottom.equalTo(textFieldsStack.snp.top).offset(-60).priority(.low)
        }
        
        textFieldsStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.view.snp.centerY)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(textFieldsStack.snp.bottom).offset(30)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(loginButton.snp.bottom).offset(50)
        }
    }

    @objc private func didTapLoginButton(_ sender: Any) {
        didSendEventClosure?(.login)
    }
}

extension LoginViewController {
    enum Event {
        case login
    }
}

