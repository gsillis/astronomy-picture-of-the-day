//
//  LoginButtonUITests.swift
//  ViewCodeTests
//
//  Created by Gabriela Sillis on 09/09/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCode

class LoginButtonUITests: XCTestCase {

    func testLoginButton() {
        let button = LoginButton()
        button.setTitle("login", for: .normal)

        let size: CGSize = CGSize(width: 200, height: 50)
        assertSnapshot(matching: button, as: Snapshotting.image(size: size))
    }
}
