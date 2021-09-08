//
//  UIColor+Extensions.swift
//  ViewCode
//
//  Created by Gabriela Sillis on 23/08/21.
//

import UIKit

extension UIColor {

    // cria um init para UIColor usando int ao invés de CGFloat
    convenience init(colorRed: Int, colorGreen: Int, colorBlue: Int) {
        // pega o int passado e converte para CGFloat
        // o calculo é valor da cor é Int/255.0 -> converte em CGFloat
        self.init(red: CGFloat(colorRed)/255.0, green: CGFloat(colorGreen)/255.0, blue: CGFloat(colorBlue)/255.0, alpha: 1)
    }

    // static let aqui, serve para poder chamar UIColor.customBlue em qualquer View
   static let customRed: UIColor = UIColor(colorRed: 232, colorGreen: 49, colorBlue: 93)
}
