//
//  UIView+extension.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import UIKit

extension UIView {
    func addShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        clipsToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
}
