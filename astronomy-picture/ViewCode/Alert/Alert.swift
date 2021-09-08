//
//  Alert.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 30/08/21.
//

import Foundation
import UIKit


class Alert: NSObject {
    var controller: UIViewController

    init(controller: UIViewController) {
        self.controller = controller
    }

    // cria um alert com completion opcional 
    func showAlert(title: String, message: String, completion:(() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            completion?()
        }))
        self.controller.present(alert, animated: true, completion: nil)
    }
}
