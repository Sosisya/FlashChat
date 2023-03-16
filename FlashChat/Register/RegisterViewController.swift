//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 12.03.2023.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    private let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.placeholder = K.TextFields.emailTextFieldTitle
        textfield.textAlignment = .center
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 24
        return textfield
    }()

    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.placeholder = K.TextFields.passwordTextFieldTitle
        textfield.textAlignment = .center
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 24
        textfield.isSecureTextEntry = true
        return textfield
    }()

    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(K.Buttons.registerButtonTitle, for: .normal)
        button.setTitleColor(UIColor(named: K.Colors.blue), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.Colors.lightBlue)
        setupLayout()
        setupConstraints()
        cofigureButton()
        navigationController?.navigationBar.tintColor = UIColor(named: K.Colors.blue)
    }
}

extension RegisterViewController {
    private func setupLayout() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),

            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func cofigureButton() {
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
    }

    @objc func registerButtonAction() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                let chatVC = ChatViewController()
                self.show(chatVC, sender: self)
            }
        }
    }
}
