//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 12.03.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    private let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.placeholder = K.TextFields.emailTextFieldTitle
        textfield.text = "1@2.com"
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
        textfield.text = "123456"
        textfield.textAlignment = .center
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 24
        textfield.isSecureTextEntry = true
        return textfield
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(K.Buttons.loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.masksToBounds = true
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.Colors.blue)
        setupLayout()
        setupConstraints()
        cofigureButton()
    }
}

extension LoginViewController {
    private func setupLayout() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
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

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func cofigureButton() {
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }

    @objc func loginButtonAction() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                let chatVC = ChatViewController()
                self?.show(chatVC, sender: self)
            }
        }
    }
}
