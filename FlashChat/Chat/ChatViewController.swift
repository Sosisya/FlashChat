//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 12.03.2023.
//

import UIKit

class ChatViewController: UIViewController {

    let textFieldView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let messageTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Write your message..."
        textfield.textAlignment = .left
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 12
        return textfield
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()

    private let chatTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "blue")
        setupLayout()
        setupConstraints()
        cofigureButton()
        configureTableView()
    }
}

extension ChatViewController {
    private func setupLayout() {
        view.addSubview(textFieldView)
        view.addSubview(chatTableView)
        textFieldView.addSubview(stackView)
        stackView.addArrangedSubview(messageTextField)
        stackView.addArrangedSubview(sendButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: textFieldView.topAnchor),

            textFieldView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textFieldView.heightAnchor.constraint(equalToConstant: 60),

            stackView.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -8),

            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func configureTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none
        chatTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
    }

    private func cofigureButton() {
        sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
    }

    @objc func sendButtonAction() {
        print("send")
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        return cell
    }
}
