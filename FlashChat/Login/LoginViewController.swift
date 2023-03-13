//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 12.03.2023.
//

import UIKit

class LoginViewController: UIViewController {

   private let emailTextField: UITextField = {
       let textfield = UITextField()
       textfield.translatesAutoresizingMaskIntoConstraints = false
       textfield.borderStyle = .none
       textfield.placeholder = "E-mail"
       textfield.textAlignment = .center
       textfield.layer.masksToBounds = true
       textfield.backgroundColor = .white
       textfield.layer.cornerRadius = 24
       return textfield
    }()

    private let paswordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.placeholder = "Password"
        textfield.textAlignment = .center
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 24
        return textfield
     }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.masksToBounds = true
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "blue")
        setupLayout()
        setupConstraints()
        cofigureButton()
    }
}

extension LoginViewController {
    private func setupLayout() {
        view.addSubview(emailTextField)
        view.addSubview(paswordTextField)
        view.addSubview(loginButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),

            paswordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            paswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            paswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            paswordTextField.heightAnchor.constraint(equalToConstant: 48),

            loginButton.topAnchor.constraint(equalTo: paswordTextField.bottomAnchor, constant: 16),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func cofigureButton() {
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }

    @objc func loginButtonAction() {
        let chatVC = ChatViewController()
        show(chatVC, sender: self)
    }
}
