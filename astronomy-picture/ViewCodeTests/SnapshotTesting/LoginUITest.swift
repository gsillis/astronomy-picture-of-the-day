//
//  LoginUITest.swift
//  ViewCodeTests
//
//  Created by Gabriela Sillis on 08/09/21.
//

import XCTest
import SnapshotTesting
@testable import ViewCode

class LoginUITest: XCTestCase {

    func testLoginView() {
        let vc = LoginVC()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let size = CGSize(width: width, height: height)

        assertSnapshot(matching: vc, as: Snapshotting.image(size: size))
    }
}
