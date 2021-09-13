//
//  LoginScreen.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 23/08/21.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func configTappedLoginButton()
    func configTappedRegisterButton()
}

class LoginScreen: UIView {

    private weak var  delegate: LoginScreenProtocol?

    // MARK: - UIView

    lazy private var loginImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "login")
        image.contentMode = .scaleAspectFit

        return image
    }()

    lazy private var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Astronomy Picture of the Day"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .customRed
        label.numberOfLines = 0

        return  label
    }()

    lazy var emailTexfield: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .customRed
        text.borderStyle = .roundedRect
        text.keyboardType = .emailAddress
        text.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        text.autocorrectionType = .no
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 15)

        return text
    }()

    lazy var passwordTexfield: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .customRed
        password.borderStyle = .roundedRect
        password.keyboardType = .default
        password.isSecureTextEntry = true
        password.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        password.autocorrectionType = .no
        password.textColor = .white
        password.font = UIFont.systemFont(ofSize: 15)

        // text.becomeFirstResponder()
        return password
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.setTitle("login", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.isEnabled = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)

        return button
    }()

    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("create account", for: .normal)
        registerButton.setTitleColor(.customRed, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        registerButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)

        return registerButton
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configBackground()
        self.configSubview()
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public func

    public func configLoginDelegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }

    public func validateTexfield() {
        guard let email = emailTexfield.text, let pass = passwordTexfield.text else { return }

        email.isEmpty && pass.isEmpty ? self.configButtonEnable(is: false): self.configButtonEnable(is: true)
    }

    public func texfieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTexfield.delegate = delegate
        self.passwordTexfield.delegate = delegate
    }


    // MARK: - Private func

    private func configSubview() {
        self.addSubview(self.loginImageView)
        self.addSubview(self.loginLabel)
        self.addSubview(self.emailTexfield)
        self.addSubview(self.passwordTexfield)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }

    private func configBackground() {
        self.backgroundColor = .black
    }

    @objc private func tappedLoginButton() {
        self.delegate?.configTappedLoginButton()
    }

    @objc private func tappedRegisterButton() {
        self.delegate?.configTappedRegisterButton()
    }

    private func configButtonEnable(is enable: Bool) {
        if enable {
            self.loginButton.isEnabled = true
            self.loginButton.setTitleColor(.customRed, for: .normal)
            self.loginButton.layer.borderColor = UIColor.customRed.cgColor
        }
    }

    // MARK: - Constraints
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            // MARK: - loginImageView

            self.loginImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            // trailing = lado direito da tela
            self.loginImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            // leading = lado esquerdo da tela
            self.loginImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.loginImageView.heightAnchor.constraint(equalToConstant: 250),

            // MARK: - loginLabel

            self.loginLabel.topAnchor.constraint(equalTo: self.loginImageView.bottomAnchor, constant: 30),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.loginImageView.centerXAnchor),

            // MARK: - emailTexfield

            self.emailTexfield.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 30),
            self.emailTexfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.emailTexfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.emailTexfield.heightAnchor.constraint(equalToConstant: 40),

            // MARK: - passwordTexfield

            self.passwordTexfield.topAnchor.constraint(equalTo: self.emailTexfield.bottomAnchor, constant: 30),
            self.passwordTexfield.leadingAnchor.constraint(equalTo: self.emailTexfield.leadingAnchor),
            self.passwordTexfield.trailingAnchor.constraint(equalTo: self.emailTexfield.trailingAnchor),
            self.passwordTexfield.heightAnchor.constraint(equalTo: self.emailTexfield.heightAnchor),

            // MARK: - loginLabel

            self.loginButton.topAnchor.constraint(equalTo: self.passwordTexfield.bottomAnchor, constant: 50),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTexfield.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTexfield.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),

            // MARK: - loginLabel
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 10),
            self.registerButton.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor)

        ])
    }
}
