//
//  LoginButton.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 09/09/21.
//

import UIKit


class LoginButton: UIButton {

    // MARK: - loginButton
    lazy private var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.isEnabled = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)

        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubview()
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Config Subview

    private func configSubview() {
        self.addSubview(self.loginButton)
    }

    // MARK: - Config Constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
