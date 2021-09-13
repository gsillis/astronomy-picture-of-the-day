//
//  RegisterScreen.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 24/08/21.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func configTappedBackButton()
    func configTappedRegisterButton()
}

class RegisterScreen: UIView {

    // MARK: - Private properties

    private weak var delegate: RegisterScreenProtocol?

    // MARK: - UIView

    lazy private var userImageView: UIImageView = {
        let userImage = UIImageView()
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.image = UIImage(named: "user")
        
        return userImage
    }()
    
    lazy private var returnButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedReturnButton), for: .touchUpInside)
        
        return button
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
        
        return password
    }()
    
    lazy private var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.setTitle("login", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubview()
        self.configConstraints()
        self.configBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public func

    public func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }

    public func texfieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTexfield.delegate = delegate
        self.passwordTexfield.delegate = delegate
    }

    public func validateTexfield() {
        guard let email = emailTexfield.text, let pass = passwordTexfield.text else { return }

        email.isEmpty && pass.isEmpty ? self.configButtonEnable(is: false): self.configButtonEnable(is: true)
    }

    // MARK: - Private func

    private func configSubview() {
        self.addSubview(self.userImageView)
        self.addSubview(self.returnButton)
        self.addSubview(self.emailTexfield)
        self.addSubview(self.passwordTexfield)
        self.addSubview(self.registerButton)
    }
    
    private func configBackground() {
        self.backgroundColor = .black
    }

    @objc private func tappedReturnButton() {
        self.delegate?.configTappedBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.configTappedRegisterButton()
    }

    private func configButtonEnable(is enable: Bool) {
        if enable {
            self.registerButton.isEnabled = true
            self.registerButton.setTitleColor(.customRed, for: .normal)
            self.registerButton.layer.borderColor = UIColor.customRed.cgColor
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            // MARK: - userImageView
            self.userImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.userImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.userImageView.widthAnchor.constraint(equalToConstant: 150),
            self.userImageView.heightAnchor.constraint(equalToConstant: 150),
            
            // MARK: - returnButton
            self.returnButton.topAnchor.constraint(equalTo: self.userImageView.topAnchor),
            self.returnButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            // MARK: - emailTexfield
            
            self.emailTexfield.topAnchor.constraint(equalTo: self.userImageView.bottomAnchor, constant: 30),
            self.emailTexfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.emailTexfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.emailTexfield.heightAnchor.constraint(equalToConstant: 40),
            
            // MARK: - passwordTexfield
            
            self.passwordTexfield.topAnchor.constraint(equalTo: self.emailTexfield.bottomAnchor, constant: 30),
            self.passwordTexfield.leadingAnchor.constraint(equalTo: self.emailTexfield.leadingAnchor),
            self.passwordTexfield.trailingAnchor.constraint(equalTo: self.emailTexfield.trailingAnchor),
            self.passwordTexfield.heightAnchor.constraint(equalTo: self.emailTexfield.heightAnchor),
            
            // MARK: - registerButton
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTexfield.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTexfield.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTexfield.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
