//
//  Constants.swift
//  FlashChat
//
//  Created by Луиза Самойленко on 14.03.2023.
//

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "MessageTableViewCell"

    struct Colors {
        static let blue = "blue"
        static let lightBlue = "lightBlue"
    }

    struct Images {
        static let exitImage = "rectangle.portrait.and.arrow.right"
        static let sendImage = "paperplane.fill"
        static let currentUserProfileImage = "me"
        static let otherUserProfileImage = "you"
    }

    struct Buttons {
        static let registerButtonTitle = "Register"
        static let loginButtonTitle = "Log in"
    }

    struct TextFields {
        static let emailTextFieldTitle = "E-mail"
        static let passwordTextFieldTitle = "Password"
    }

    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
