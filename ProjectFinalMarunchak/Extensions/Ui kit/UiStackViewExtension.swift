//
//  UiStackViewExtension.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//


import Foundation
import UIKit

extension UIStackView{
    convenience init(arrangedSubviews:[UIView],axis: NSLayoutConstraint.Axis,spacing: CGFloat,distribution:UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
