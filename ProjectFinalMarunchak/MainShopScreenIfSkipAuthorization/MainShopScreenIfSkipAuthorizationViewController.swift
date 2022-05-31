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
        (view as? MainShopScreenIfSkipAuthorizationView)?.delegate = self
        view.backgroundColor = .systemMint
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainShopScreenIfSkipAuthorizationViewController:buttonTapper{
    func buttonTaps() {
        print(" i should disappear")
        navigationController?.popViewController(animated: false)
        //        self.dismiss(animated: true, completion: nil)
    
}
}
