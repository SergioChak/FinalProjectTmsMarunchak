//
//  MainShopScreenIfSkipAuthorizationView.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import UIKit

class MainShopScreenIfSkipAuthorizationView: UIView {

    private lazy var thanksLabel: UILabel = {
        let label = UILabel()
        label.text = "Ну шо Вася?\nГо закупаться!"
        label.font = UIFont(name: "Intro-Black", size: 36)
//        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.widthAnchor.constraint(equalToConstant: 311).isActive = true
        label.heightAnchor.constraint(equalToConstant: 52).isActive = true
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func addSubs(){
    addSubview(thanksLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubs()
        setUpConstraints()
    }
    
    private func setUpConstraints(){
        setupConstraintsForTopLabel()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraintsForTopLabel(){
        NSLayoutConstraint.activate([
            thanksLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            thanksLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            thanksLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 258)
        ])
    }
}
