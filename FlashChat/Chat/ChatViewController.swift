//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 12.03.2023.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    let db = Firestore.firestore()

    var messages: [Messages] = [
        Messages(sender: "1@2.com", body: "Hi"),
        Messages(sender: "3@4.com", body: "Hello"),
        Messages(sender: "1@2.com", body: "How r u?")
    ]

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
        button.setImage(UIImage(systemName: K.Images.sendImage), for: .normal)
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
        view.backgroundColor = UIColor(named: K.Colors.blue)
        setupLayout()
        setupConstraints()
        cofigureButton()
        configureTableView()
        configureNavigationBar()
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
        chatTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: K.cellIdentifier)
    }

    private func configureNavigationBar() {
        let exitBarButtonItem = UIBarButtonItem(image: UIImage(systemName: K.Images.exitImage), style: .plain, target: self, action: #selector(onExitButtonClicked))
        self.navigationItem.rightBarButtonItem  = exitBarButtonItem
        navigationItem.hidesBackButton = true
        title = K.appName
    }

    @objc func onExitButtonClicked(_ sender: Any){
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

    private func cofigureButton() {
        sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
    }

    @objc func sendButtonAction() {
        guard let message = messageTextField.text, let messageSender = Auth.auth().currentUser?.email else { return }
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: messageSender,
            K.FStore.bodyField: message
        ])  { error in
            if let e = error {
                print("There was an issue saving data to firestore \(e)")
            } else {
                print("Successfully saved data.")
            }
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageTableViewCell
        cell.messageLabel.text = messages[indexPath.row].body
        cell.selectionStyle = .none
        return cell
    }
}
