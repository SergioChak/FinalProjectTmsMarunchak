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
    
    private lazy var RealhomeButton: UIButton = {
       let button = UIButton()
        button.tintColor = .red
        button.setImage(UIImage(named: "homeScreenTabbarItem"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(homebuttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var thanksLabel: UILabel = {
        let label = UILabel()
        label.text = "Ну привет?\nТут будет потом главный экран!"
        label.font = UIFont(name: "Intro-Black", size: 36)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    
    //MARK: constraints var's for Topbutton
    private lazy var topConstraintForButton = homeButton.topAnchor.constraint(equalTo: RealhomeButton.bottomAnchor, constant: 48)
    private lazy var leadingConstraintForButton = homeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32)
    private lazy var trailingConstraintForButton = homeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32)
    
//MARK: constraints var's for label
    private lazy var topConstraintForLabel = thanksLabel.topAnchor.constraint(equalTo: RealhomeButton.bottomAnchor, constant: 258)
    private lazy var leadingConstraintForLabel = thanksLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32)
    private lazy var trailingConstraintForLabel = thanksLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32)
    
    
    //MARK: constraints var's for Homebutton
    private lazy var topConstraintForHomeButton = RealhomeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 48)
    private lazy var leadingConstraintForHomeButton = RealhomeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32)
    private lazy var trailingConstraintForHomeButton = RealhomeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32)
    
    
    private func configGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LabelDidTap))
        tapGesture.numberOfTapsRequired = 1
//        tapGesture.numberOfTouchesRequired = 1
        thanksLabel.addGestureRecognizer(tapGesture)
    }
    
    private func addSubs(){
        addSubview(homeButton)
        addSubview(RealhomeButton)
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
        setupConstraintsForHomeButton()
    }
    
    private func setupConstraintsForHomeButton(){
        NSLayoutConstraint.activate([
            topConstraintForHomeButton,leadingConstraintForHomeButton,trailingConstraintForHomeButton
        ])
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

//MARK: animation on button and label
extension MainShopScreenIfSkipAuthorizationView{
    //animation on second button
    @objc private func buttonTapped(){
        topConstraintForButton.constant += 120
        leadingConstraintForButton.constant -= 50
        topConstraintForLabel.constant += 10
        leadingConstraintForLabel.constant += 30
        UIView.animate(withDuration: 1.3, delay: .zero, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .curveEaseOut){
            self.layoutIfNeeded()
        }
        
    }
    
    
    
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
@objc private func homebuttonTapped(_ sender:UIButton){
    delegate?.buttonTaps()
}
}

