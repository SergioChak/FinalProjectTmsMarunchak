//
//  FramesView.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 26.05.2022.
//

import UIKit

final class FramesView: UIView {
    private let thanksLabel: UILabel = {
        let label = UILabel()
        label.text = "Thank You\nFor Registration!"
        label.font = UIFont(name: "Intro-Black", size: 36)
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private lazy var  aproveEmailLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = "To approve your account - please open the mail, we've send you on your E-Mail, and click the link in it!"
        label.font = UIFont(name: "Intro-Black", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
   
    private func configGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(aproveEmailLabelDidTap))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        aproveEmailLabel.addGestureRecognizer(tapGesture)
    }
    
    private let goShoppingButton: UIButton = {
       let button = UIButton()
        button.layer.backgroundColor = UIColor(red: 0.941, green: 0.647, blue: 0, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.setTitle("Go Shopping!", for: .normal)
        button.addTarget(self, action: #selector(buttonTaps), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(thanksLabel)
        addSubview(aproveEmailLabel)
        configGesture()
        addSubview(goShoppingButton)
//        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        thanksLabel.frame = CGRect(x: 32, y: 258, width: 311, height: 52)
        aproveEmailLabel.frame = CGRect(x: 26, y: 347, width: 320, height: 80)
        goShoppingButton.frame = CGRect(x: 63, y: aproveEmailLabel.frame.origin.y + aproveEmailLabel.frame.height + 8, width: 250, height: 50)
        
    }
    

}
 extension FramesView{
     
     @objc private func aproveEmailLabelDidTap(_ gesture:UITapGestureRecognizer){
         UIView.animateKeyframes(withDuration: 4, delay: .zero, options: .calculationModePaced){
             UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1){
                 self.aproveEmailLabel.transform = CGAffineTransform(scaleX: -2, y: -2)
             }
             UIView.addKeyframe(withRelativeStartTime: 2, relativeDuration: 1.5){
                 self.aproveEmailLabel.transform = CGAffineTransform(scaleX: +1, y: +1) }
         }
     }
     
     @objc private func buttonTaps(){
         print("the button was actually tapped!")
         UIView.animateKeyframes(withDuration: 4, delay: .zero, options: [.calculationModePaced,.autoreverse]){
             UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1){
             self.goShoppingButton.transform = CGAffineTransform(rotationAngle: 69)
             }
                 UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 1){
             self.goShoppingButton.transform = CGAffineTransform(scaleX: -1, y: 2)
             }
             UIView.addKeyframe(withRelativeStartTime: 2, relativeDuration: 1){
                 self.goShoppingButton.transform = CGAffineTransform(scaleX: +1, y: 2)
                 }

     }
     
}


//         print("button frame is \(goShoppingButton.frame) and buttons bounds are \(goShoppingButton.bounds)")
//         goShoppingButton.frame.origin = .init(x: 80, y: aproveEmailLabel.frame.origin.y + aproveEmailLabel.frame.height + 8 + 50)

//         print("button frame is \(goShoppingButton.frame) and buttons bounds are \(goShoppingButton.bounds)")

 }
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//      let view = super.hitTest(point, with: event)
//        print(view is UIButton)
//        return view
//    }
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        super.point(inside: point, with: event)
//        let extendedButtonFrame = CGRect(origin: goShoppingButton.frame.origin, size: .init(width: goShoppingButton.frame.width + 150, height: goShoppingButton.frame.height + 150))
//        return extendedButtonFrame.contains(point)
//    }
  
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//         super.hitTest(point, with: event) // 4
//        let biggerButtonFrame = CGRect(origin: goShoppingButton.frame.origin, size: .init(width: goShoppingButton.frame.width + 40, height: goShoppingButton.frame.height + 40))
//        goShoppingButton.frame.contains(CGRect(origin: goShoppingButton.frame.origin, size: CGSize.init(width: goShoppingButton.frame.width + 40, height: goShoppingButton.frame.height + 40)))
//       biggerButtonFrame.contains(point)
//        print("Button area was extended")
//          return goShoppingButton
//
//
//}
