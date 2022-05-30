//
//  MainShopScreenIfSkipAuthorizationViewController.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import UIKit
protocol buttonTapper:AnyObject{
    func buttonTaps()
}


class MainShopScreenIfSkipAuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
view = MainShopScreenIfSkipAuthorizationView()
        view.backgroundColor = .systemMint
        // Do any additional setup after loading the view.
    }
 
}

extension MainShopScreenIfSkipAuthorizationViewController:buttonTapper{
    func buttonTaps() {
        print(" i should disappear")
        navigationController?.popToRootViewController(animated: false)
//        self.dismiss(animated: true, completion: nil)
    
}
}
