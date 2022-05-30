//
//  CartViewController.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 30.05.2022.
//

import UIKit

protocol buttonTapp:AnyObject{
    func buttonTaps()
    
}

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = CartView()
        (view as? CartView)?.delegate = self
        view.backgroundColor = .white
    
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "arrow_back"), for: .normal)
        backbutton.isHidden = true
        backbutton.tintColor = .black
        backbutton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        // Do any additional setup after loading the view.
    }
    

}

extension CartViewController:buttonTapp{
    func buttonTaps() {
        navigationController?.popToRootViewController(animated: false)
    }
    
    @objc private func backAction(){
    self.navigationController?.popViewController(animated: true)
}
}
