//
//  MainShopScreenIfSkipAuthorizationView.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import UIKit

class MainShopScreenIfSkipAuthorizationView: UIView {
    weak var delegate:buttonTapper?
    
    private lazy var homeButton: UIButton = {
       let button = UIButton()
        button.tintColor = .red
        button.setImage(UIImage(named: "userFilled"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var thanksLabel: UILabel = {
        let label = UILabel()
        label.text = "Ну шо Вася?\nГо закупаться!"
        label.font = UIFont(name: "Intro-Black", size: 36)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        //        label.font = .boldSystemFont(ofSize: 20)
        //        label.widthAnchor.constraint(equalToConstant: 311).isActive = true
        //        label.heightAnchor.constraint(equalToConstant: 52).isActive = true
        return label
    }()
    
//MARK: constraints var's for label
    private lazy var topConstraintForLabel = thanksLabel.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 258)
    private lazy var leadingConstraintForLabel = thanksLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32)
    private lazy var trailingConstraintForLabel = thanksLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32)
    
    //MARK: constraints var's for button
    private lazy var topConstraintForButton = homeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48)
    private lazy var leadingConstraintForButton = homeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32)
    private lazy var trailingConstraintForButton = homeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32)

    
    private func configGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LabelDidTap))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        thanksLabel.addGestureRecognizer(tapGesture)
    }
    
    private func addSubs(){
        addSubview(homeButton)
        addSubview(thanksLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubs()
        setUpConstraints()
        configGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints(){
        setupConstraintsForTopLabel()
        setupConstraintsForTopButton()
    }
    
    private func setupConstraintsForTopButton(){
        NSLayoutConstraint.activate([
            topConstraintForButton,leadingConstraintForButton,trailingConstraintForButton
        ])
    }
    
    private func setupConstraintsForTopLabel(){
        NSLayoutConstraint.activate([
            leadingConstraintForLabel,trailingConstraintForLabel,topConstraintForLabel
        ])
    }
}

extension MainShopScreenIfSkipAuthorizationView{
   // animation for label on tap
    @objc private func LabelDidTap(_ gesture:UITapGestureRecognizer){
        topConstraintForLabel.constant += 100
        leadingConstraintForLabel.constant += 30
//        trailingConstraint.constant -= 100
        thanksLabel.text = "А теперь лови меня, галава)"
        UIView.animate(withDuration: 1.5, delay: .zero, options: [.curveEaseIn, .curveEaseInOut, .allowUserInteraction]){
        self.layoutIfNeeded()
        }
        
        topConstraintForLabel.constant -= 100
        leadingConstraintForLabel.constant -= 30
//        trailingConstraint.constant += 100
        UIView.animate(withDuration: 1, delay: 1.5, options: [.curveEaseOut, .curveEaseIn]){
        self.layoutIfNeeded()
        }
        print("it works")
    }

    
    // pop back the VC on tapping button
@objc private func buttonTapped(_ sender:UIButton){
    delegate?.buttonTaps()
    print(" i should disappear")

}
}

