//
//  WIshListViewController.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 30.05.2022.
//

import UIKit
protocol buttonTapOnWishList:AnyObject{
    func buttonTaps()
    
}
class WIshListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = WishListView()
        (view as? WishListView)?.delegate = self
        view.backgroundColor = .white
    
        let backbutton = UIButton(type: .custom)
        backbutton.isHidden = true
        backbutton.setImage(UIImage(named: "arrow_back"), for: .normal)
        backbutton.tintColor = .black
        backbutton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        // Do any additional setup after loading the view.
    }
    

}

extension WIshListViewController:buttonTapOnWishList{
    func buttonTaps() {
        navigationController?.popToRootViewController(animated: false)
    }
    
    @objc private func backAction(){
    self.navigationController?.popViewController(animated: true)
}
}
