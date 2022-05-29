//
//  Extension for Vc barButtonItem.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import Foundation
import UIKit

extension UIViewController{
    func createCustomButton(selector: Selector) -> UIBarButtonItem {
         
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "userFilled"), for: .normal)
        button.tintColor = .systemPurple
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
