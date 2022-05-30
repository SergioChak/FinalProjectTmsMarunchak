//
//  WishListView.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 30.05.2022.
//

import UIKit

class WishListView: UIView {
    weak var delegate:buttonTapOnWishList?
//MARK: initializing subviews
    
    private lazy var wishListLabel: UILabel = {
       let cart = UILabel()
        cart.font = UIFont(name: "Intro-Black", size: 36)
        cart.text = "Wish-List"
        cart.textAlignment = .center
        return cart
    }()
    
    private lazy var crossLine: UIView = {
    let stroke = UIView()
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        return stroke
    }()

    private lazy var wishListImage: UIImageView = {
        let cartImage = UIImageView()
        cartImage.image = UIImage(named: "wishListbigPicture")
        cartImage.backgroundColor = .white
        return cartImage
    }()
    
    private lazy var wishListIsEmptyLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Intro-Black", size: 20)
        label.text = "Your wish list is empty right now"
        label.textAlignment = .center
       return label
    }()
    
    private lazy var aboutAddingToWishListLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Intro-Regular", size: 15)
        label.text = "Products added to your wish list, will be added in app after authorization"
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
        addSubview(wishListLabel)
        addSubview(crossLine)
        addSubview(wishListImage)
        addSubview(wishListIsEmptyLabel)
        addSubview(aboutAddingToWishListLabel)
        addSubview(backToSigningButton)
    }
    
    private func setupConstraints(){
        [wishListLabel,wishListImage,crossLine,wishListIsEmptyLabel,aboutAddingToWishListLabel,backToSigningButton].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}


        NSLayoutConstraint.activate([
            wishListLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 72),
            wishListLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            wishListLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            wishListLabel.widthAnchor.constraint(equalToConstant: 311),
            wishListLabel.heightAnchor.constraint(equalToConstant: 52)
            
        ])
        
        NSLayoutConstraint.activate([
            crossLine.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            crossLine.heightAnchor.constraint(equalToConstant: 1),
            crossLine.topAnchor.constraint(equalTo: wishListLabel.bottomAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.activate([
            wishListImage.widthAnchor.constraint(equalToConstant: 150),
            wishListImage.heightAnchor.constraint(equalToConstant: 150),
            wishListImage.topAnchor.constraint(equalTo: crossLine.bottomAnchor, constant: 152),
            wishListImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 113),
            wishListImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -112)
        ])
        
        
        NSLayoutConstraint.activate([
            wishListIsEmptyLabel.widthAnchor.constraint(equalToConstant: 334),
            wishListIsEmptyLabel.heightAnchor.constraint(equalToConstant: 66),
            wishListIsEmptyLabel.topAnchor.constraint(equalTo: wishListImage.bottomAnchor, constant: 12),
            wishListIsEmptyLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 21)
//            cartEmptyLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            aboutAddingToWishListLabel.widthAnchor.constraint(equalToConstant: 323),
            aboutAddingToWishListLabel.heightAnchor.constraint(equalToConstant: 59),
            aboutAddingToWishListLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            aboutAddingToWishListLabel.topAnchor.constraint(equalTo: wishListIsEmptyLabel.bottomAnchor,constant: -24)
        ])
     
        NSLayoutConstraint.activate([
            backToSigningButton.widthAnchor.constraint(equalToConstant: 250),
            backToSigningButton.heightAnchor.constraint(equalToConstant: 50),
            backToSigningButton.topAnchor.constraint(equalTo: aboutAddingToWishListLabel.bottomAnchor, constant: 8),
            backToSigningButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 63),
            backToSigningButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -62)
        ])
        
        
    }
    
    
    
 

}
