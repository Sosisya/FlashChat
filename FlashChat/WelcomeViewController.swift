import UIKit

class WelcomeViewController: UIViewController {

    let welcomeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚡️FlashChat"
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.textColor = UIColor(named: "blue")
        label.textAlignment = .center
        return label
    }()

    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(named: "blue"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.backgroundColor = UIColor(named: "lightBlue")
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.backgroundColor = UIColor(named: "blue")
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupConstraints()
    }
}

extension WelcomeViewController {
    private func setupLayout() {
        view.addSubview(welcomeTitleLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
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
}

