//
//  ViewController.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 20/08/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    // MARK: - Private properties

    private var loginScreen: LoginScreen?
    private var auth: Auth?
    private var alert: Alert?

    // MARK: - View Lifecycle

    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
        self.loginScreen?.configLoginDelegate(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.texfieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }

    override func viewWillAppear(_ animated: Bool) {

        // remove a navigation controller que foi criada no Scene delegate
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - LoginScreenProtocol
extension LoginVC: LoginScreenProtocol {
    func configTappedLoginButton() {
        let homeVC: HomeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
//        guard let email = self.loginScreen?.emailTexfield.text,
//              let password = self.loginScreen?.passwordTexfield.text else {
//            return
//        }
//
//        // loga o user no firebase
//        self.auth?.signIn(withEmail: email, password: password, completion: { success, error in
//
//            if error != nil {
//                self.alert?.showAlert(title: "Atenção", message: "Dados incorretos")
//            } else if success == nil {
//                self.alert?.showAlert(title: "Oops", message: "Algo deu errado, tente novamente mais tarde")
//            } else {
//                self.alert?.showAlert(title: "Tudo certo", message: "Login realizado com sucesso")
//            }
//        })
    }

    func configTappedRegisterButton() {
        let registerVc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTexfield()
    }
}
