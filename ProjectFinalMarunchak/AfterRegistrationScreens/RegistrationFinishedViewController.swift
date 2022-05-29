//
//  RegistrationFinishedViewController.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import UIKit
protocol ButtonListener: AnyObject{
    func listenButton()
}

class RegistrationFinishedViewController: UIViewController, ButtonListener {
    func listenButton() {
        present(FramesViewController(), animated: true)
        
//        let navVc = UINavigationController(rootViewController: MainShopScreenIfSkipAuthorizationViewController())
//            navVc.modalPresentationStyle = .fullScreen
//            self.present(navVc, animated: true)
        
//        present(MainShopScreenIfSkipAuthorizationViewController(),animated: false)
    }
    

    override func loadView() {
        super.loadView()
        view = RegistrationFinishedView()
        (view as? RegistrationFinishedView)?.delegator = self
        view.backgroundColor = .white
        title = .none
        //MARK: строчкой ниже можно включить переворот вьюх, при развороте экрана, либо задать ему какую то опеределенную ориентацию!
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "arrow_back"), for: .normal)
        backbutton.tintColor = .black
        backbutton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        }

    }
  //MARK: extensions

extension RegistrationFinishedViewController{
    
    @objc private func backAction(){
    self.navigationController?.popViewController(animated: true)
}
}
