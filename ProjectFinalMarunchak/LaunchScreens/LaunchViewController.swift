//
//  ViewController.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//


import UIKit

class LaunchViewController: UIViewController {
    let launchScreenImageView: UIImageView = {
       let uiImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 328, height: 72))
        uiImageView.image = UIImage(named: "voznyaLogo")
        uiImageView.tintColor = .lightGray
        return uiImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(launchScreenImageView)
        view.backgroundColor = .clear

    }
    private func animate(){
        UIView.animate(withDuration: 1 , animations: {
            let size =  self.view.frame.size.width*1.4
            let diffX = size - self.view.frame.size.width
            let diffY =  self.view.frame.size.height - size
            self.launchScreenImageView.tintColor = .white

            
            self.launchScreenImageView.frame = CGRect(
                x: -(diffX/2),
                y:  diffY/2,
                width: size,
                height:size )
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.launchScreenImageView.alpha = 0
        },completion: {done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                    let mainScreen = UINavigationController(rootViewController: RegistrationViewController())
                    mainScreen.modalTransitionStyle = .coverVertical
                    mainScreen.modalPresentationStyle = .fullScreen
                    self.present(mainScreen, animated: true)
                
                })
            
        }
        })
    }

    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        launchScreenImageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6, execute: {
            self.animate()
        })
        animate()
    }
    
    
    
}
