//
//  UIImageView+Extensions.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 06/09/21.
//

import UIKit

extension UIImageView {
    func setupBorderImage(borderColor: CGColor?) {
        layer.cornerRadius = 8
        clipsToBounds = true
        layer.borderColor = borderColor
        layer.borderWidth = 2.5
    }
}
