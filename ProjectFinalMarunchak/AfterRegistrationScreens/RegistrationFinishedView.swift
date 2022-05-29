//
//  RegistrationFinishedView.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import UIKit

class RegistrationFinishedView: UIView {

    weak var delegator: ButtonListener?
    
//    private lazy var arrowBackButonItem: UIBarButtonItem = {
//       let button = UIBarButtonItem()
//        button.image = UIImage(named: "arrow_back")
//        button.image?.withTintColor(.black)
//        button.customView?.isUserInteractionEnabled = true
//        button.style = .plain
//        return button
//    }()
    
    private lazy var thanksLabel: UILabel = {
        let label = UILabel()
        label.text = "Thank You\nFor Registration!"
        label.font = UIFont(name: "Intro-Black", size: 36)
//        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.widthAnchor.constraint(equalToConstant: 311).isActive = true
        label.heightAnchor.constraint(equalToConstant: 52).isActive = true
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private lazy var aproveEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "To approve your account - please open the mail, we've send you on your E-Mail, and click the link in it!"
        label.widthAnchor.constraint(equalToConstant: 323).isActive = true
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        label.font = UIFont(name: "Intro-Black", size: 14)
        label.numberOfLines = 0 
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
 
    private lazy var goShoppingButton: UIButton = {
       let button = UIButton()
        button.layer.backgroundColor = UIColor(red: 0.941, green: 0.647, blue: 0, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.setTitle("Go Shopping!", for: .normal)
        button.addTarget(self, action: #selector(goShoppingButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    @objc private func goShoppingButtonDidTap(){
        delegator?.listenButton()
        print("Works or not???")

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setUpConstraints()
    }
    
    
   private func addSubviews(){
        addSubview(thanksLabel)
        addSubview(aproveEmailLabel)
        addSubview(goShoppingButton)
        for sub in subviews{
            sub.translatesAutoresizingMaskIntoConstraints = false
//            self.clipsToBounds = true
        }
    }
    
    private func setUpConstraints(){
        setupConstraintsForTopLabel()
        setupConstraintsForEmailLabel()
        setupButtonConstraints()
    }
    
    private func setupConstraintsForTopLabel(){
        NSLayoutConstraint.activate([
            thanksLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            thanksLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            thanksLabel.topAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor, constant: 258)
        ])
    }
    private func setupConstraintsForEmailLabel(){
        NSLayoutConstraint.activate([
            aproveEmailLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            aproveEmailLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -26),
            aproveEmailLabel.topAnchor.constraint(lessThanOrEqualTo: thanksLabel.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupButtonConstraints(){
        NSLayoutConstraint.activate([
            goShoppingButton.widthAnchor.constraint(equalToConstant: 250),
            goShoppingButton.heightAnchor.constraint(equalToConstant: 50),
            goShoppingButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 63),
            goShoppingButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -62),
            goShoppingButton.topAnchor.constraint(equalTo: aproveEmailLabel.bottomAnchor, constant: 8),
            goShoppingButton.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        ])
    }
     
}

//extension RegistrationFinishedView{
//
//    @objc private func goShoppingButtonDidTap(){
//        delegator?.listenButton()
//    }
//}

