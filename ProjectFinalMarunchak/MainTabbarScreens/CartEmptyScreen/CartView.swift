//
//  CartView.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 30.05.2022.
//

import UIKit

class CartView: UIView {

    weak var delegate:buttonTapp?
//MARK: initializing subviews
    
    private lazy var cartLabel: UILabel = {
       let cart = UILabel()
        cart.font = UIFont(name: "Intro-Black", size: 36)
        cart.text = "Cart"
        cart.textAlignment = .center
        return cart
    }()
    
    private lazy var crossLine: UIView = {
    let stroke = UIView()
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        return stroke
    }()

    private lazy var cartImage: UIImageView = {
        let cartImage = UIImageView()
        cartImage.image = UIImage(named: "basketBigImage")
        cartImage.backgroundColor = .white
        return cartImage
    }()
    
    private lazy var cartEmptyLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Intro-Black", size: 20)
        label.text = "Your cart is empty🤨"
        label.textAlignment = .center
       return label
    }()
    
    private lazy var aboutAddintToCartLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Intro-Regular", size: 15)
        label.text = "Products, added to your cart, will appear in app after authorization"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
       return label
    }()
    
    private lazy var backToSigningButton: UIButton = {
       let button = UIButton()
        button.layer.backgroundColor = UIColor(red: 0.941,
                                               green: 0.647,
                                               blue: 0,
                                               alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Sign in, or sign up!", for: .normal)
        button.addTarget(self, action: #selector(backToSigningButtonDidTap), for: .touchUpInside)
        return button
    }()
    
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    @objc private func backToSigningButtonDidTap(){
        delegate?.buttonTaps()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: func that add and constraint subviews
    private func addSubviews(){
        addSubview(cartLabel)
        addSubview(crossLine)
        addSubview(cartImage)
        addSubview(cartEmptyLabel)
        addSubview(aboutAddintToCartLabel)
        addSubview(backToSigningButton)
    }
    
    private func setupConstraints(){
        [cartLabel,cartImage,crossLine,cartEmptyLabel,aboutAddintToCartLabel,backToSigningButton].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}


        NSLayoutConstraint.activate([
            cartLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 72),
            cartLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            cartLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            cartLabel.widthAnchor.constraint(equalToConstant: 311),
            cartLabel.heightAnchor.constraint(equalToConstant: 52)
            
        ])
        
        NSLayoutConstraint.activate([
            crossLine.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            crossLine.heightAnchor.constraint(equalToConstant: 1),
            crossLine.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.activate([
            cartImage.widthAnchor.constraint(equalToConstant: 150),
            cartImage.heightAnchor.constraint(equalToConstant: 150),
            cartImage.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 152),
            cartImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 113),
            cartImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -112)
        ])
        
        
        NSLayoutConstraint.activate([
            cartEmptyLabel.widthAnchor.constraint(equalToConstant: 334),
            cartEmptyLabel.heightAnchor.constraint(equalToConstant: 66),
            cartEmptyLabel.topAnchor.constraint(equalTo: cartImage.bottomAnchor, constant: 12),
            cartEmptyLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 21)
//            cartEmptyLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            aboutAddintToCartLabel.widthAnchor.constraint(equalToConstant: 323),
            aboutAddintToCartLabel.heightAnchor.constraint(equalToConstant: 59),
            aboutAddintToCartLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            aboutAddintToCartLabel.topAnchor.constraint(equalTo: cartEmptyLabel.bottomAnchor,constant: -24)
        ])
     
        NSLayoutConstraint.activate([
            backToSigningButton.widthAnchor.constraint(equalToConstant: 250),
            backToSigningButton.heightAnchor.constraint(equalToConstant: 50),
            backToSigningButton.topAnchor.constraint(equalTo: aboutAddintToCartLabel.bottomAnchor, constant: 8),
            backToSigningButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 63),
            backToSigningButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -62)
        ])
        
        
    }
    
    
    
    
    
}


