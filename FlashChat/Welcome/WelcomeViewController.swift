import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    private let welcomeTitleLabel: CLTypingLabel = {
        let label = CLTypingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = K.appName
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.textColor = UIColor(named: K.Colors.blue)
        label.textAlignment = .center
        return label
    }()

    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(K.Buttons.registerButtonTitle, for: .normal)
        button.setTitleColor(UIColor(named: K.Colors.blue), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.backgroundColor = UIColor(named: K.Colors.lightBlue)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(K.Buttons.loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.backgroundColor = UIColor(named: K.Colors.blue)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupConstraints()
        cofigureButton()
    }
}

extension WelcomeViewController {
    private func setupLayout() {
        view.addSubview(welcomeTitleLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
        navigationController?.navigationBar.tintColor = .white
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -8),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            registerButton.heightAnchor.constraint(equalToConstant: 48),

            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func cofigureButton() {
        loginButton.addTarget(self, action: #selector(openLoginController), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(openRegisterController), for: .touchUpInside)
    }

    @objc func openLoginController() {
        let loginVC = LoginViewController()
        show(loginVC, sender: self)
    }

    @objc func openRegisterController() {
        let registerVC = RegisterViewController()
        show(registerVC, sender: self)
    }
}

