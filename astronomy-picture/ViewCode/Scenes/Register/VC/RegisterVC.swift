//
//  RegisterViewController.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 24/08/21.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    private var registerScreen: RegisterScreen?
    private var auth: Auth?
    private var alert: Alert?

    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.texfieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }

}

// MARK: - UITextFieldDelegate
extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTexfield()
    }
}

// MARK: - RegisterScreenProtocol
extension RegisterVC: RegisterScreenProtocol {
    func configTappedRegisterButton() {
        self.firebaseRegister()
    }

    private func firebaseRegister() {
        guard let email = self.registerScreen?.emailTexfield.text,
              let password = self.registerScreen?.passwordTexfield.text else {
            return }

        self.auth?.createUser(withEmail: email, password:
                                password, completion: { _, error in
            if error != nil {
                self.alert?.showAlert(title: "Atenção", message: "Algo deu errado, tente novamente mais tarde")
            } else {
                self.alert?.showAlert(title: "Tudo certo", message: "Seu cadastro foi criado", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }

    func configTappedBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
