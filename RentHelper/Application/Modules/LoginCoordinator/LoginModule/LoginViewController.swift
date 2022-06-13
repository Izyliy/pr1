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
    private var loginTextField: UITextField!
    private var passwordTextField: UITextField!
    
    private let stack: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField = elementsCreator.getTextField(title: "Login")
        passwordTextField = elementsCreator.getTextField(title: "Password")
        loginButton = elementsCreator.getButton()

        view.backgroundColor = Asset.Colors.vcBackground.color
        
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8.0
        stack.axis = .vertical

        stack.addArrangedSubview(loginTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(loginButton)
        
        view.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalToConstant: 200),
            stack.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
    
    func setConstraints() {
        
    }
    
    deinit {
        print("LoginViewController deinit")
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

