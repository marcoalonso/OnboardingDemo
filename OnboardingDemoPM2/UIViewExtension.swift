//
//  UIViewExtension.swift
//  OnboardingDemoPM2
//
//  Created by marco rodriguez on 21/06/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
