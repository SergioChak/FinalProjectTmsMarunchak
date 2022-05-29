//
//  RegistrationViewController.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 24.05.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
   
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImage : UIImageView = {
        let loginImage = UIImageView()
        loginImage.image = UIImage(named: "voznyaLogo")
        loginImage.tintColor = .black
        loginImage.translatesAutoresizingMaskIntoConstraints = false
        return loginImage
    }()
    
    
    private let emailTextFiled : UITextField = {
         let textfiled = UITextField()
        textfiled.borderStyle = .roundedRect
        textfiled.placeholder = "Please type your Email here..."
        textfiled.clearButtonMode = .whileEditing
        textfiled.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textfiled
    }()
    
    private let passwordTextField : UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passwordTextField.clearButtonMode = .whileEditing
        return passwordTextField
    }()
    
    private let signInButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Create a NEW Account", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let facebookLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        button.setImage(UIImage(named: "facebookLoginButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(facebookButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let googleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        button.setImage(UIImage(named: "googleLoginLogo"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(googleButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    private let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        button.setImage(UIImage(named: "appleButton"), for: .normal)
        button.clipsToBounds = true
        button.imageView?.clipsToBounds = true
        button.imageView?.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: 372).isActive = true

        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(googleButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let skipRegistrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip authorization", for: .normal)
        button.setTitleColor(UIColor(displayP3Red: CGFloat(), green: 0, blue: 0, alpha: 1), for: .normal)
//        button.setTitleColor(UIColor(named: "Red"), for: .highlighted)
        button.setTitleColor(UIColor(displayP3Red: CGFloat(), green: 0, blue: 1, alpha: 1), for: .highlighted)
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .none
       return button
    }()
    
    private var textFieldsStackView = UIStackView()
    private var signinInUpButtonsStackView = UIStackView()
    private var socialNetworkButtonsForLoginStackView = UIStackView()
    private lazy var signButtonsStackViewTop =  signinInUpButtonsStackView.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 32)
     private lazy var signButtonsStackViewLeading = signinInUpButtonsStackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 20)

    
    override func viewDidLoad() {
        super.viewDidLoad()
         (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        setupViews()
        setupDelegate()
        setConstraints()
        registerKeyboardNotification()
    }
    deinit{
        removeKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signButtonsStackViewTop.constant = 32
        signButtonsStackViewLeading.constant = 20
        signUpButton.tintColor = .white
        print("bounds of  are \(scrollView.bounds)")
        print("frame of is \(signInButton.frame)")
    }
    
    private func setupViews(){
        title = .none

        view.backgroundColor = .white
        
        textFieldsStackView = UIStackView(arrangedSubviews: [emailTextFiled, passwordTextField],
                                          axis: .vertical,
                                          spacing: 10,
                                          distribution: .fillEqually)
        
        signinInUpButtonsStackView = UIStackView(arrangedSubviews: [signInButton,signUpButton],
                                                 axis: .vertical,
                                                 spacing: 10,
                                                 distribution: .fillEqually)
        
        socialNetworkButtonsForLoginStackView = UIStackView(
            arrangedSubviews:[facebookLoginButton,googleLoginButton],
            axis: .horizontal,
            spacing: 16,
            distribution: .fillEqually)
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(backGroundView)
        backGroundView.addSubview(logoImage)
        backGroundView.addSubview(textFieldsStackView)
        backGroundView.addSubview(signinInUpButtonsStackView)
        backGroundView.addSubview(socialNetworkButtonsForLoginStackView)
        backGroundView.addSubview(appleLoginButton)
        backGroundView.addSubview(skipRegistrationButton)
        
        
    }
    
    private func setupDelegate(){
        emailTextFiled.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc private func signUpButtonDidTap(){
        signButtonsStackViewTop.constant += 100
//        signButtonsStackViewLeading.constant -= 60
        UIView.animate(withDuration: 0.3, delay: .zero, options: .curveEaseInOut){
            self.view.layoutIfNeeded()
        }
        navigationController?.pushViewController(SignupViewController(), animated: true)
        print("navigation works")
        signUpButton.tintColor = .red
    }
    
    //MARK: тут сделал переход на основной экран, сделав его рутовым навиг контроллером. Надо добавить еще таббары!!!
    @objc private func signInButtonDidTap(){
        let navVc = UINavigationController(rootViewController: MainShopScreenIfSkipAuthorizationViewController())
            navVc.modalPresentationStyle = .fullScreen
            self.present(navVc, animated: true)
       
    }
}

//MARK: - textField delegate extension
    extension RegistrationViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            emailTextFiled.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            return true
        }
    }
//MARK: keyboard hides

extension RegistrationViewController{
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardNotification(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
   
    
    @objc private func keyboardWillShow(notification: Notification){
        let userInfo = notification.userInfo
        let keyBoardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyBoardHeight.height/4)
    }
    @objc private func keyboardWillHide(notification: Notification){
//        let userInfo = notification.userInfo
//        let keyBoardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = .zero
    }
}

//MARK: - extension of constraints

extension RegistrationViewController{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backGroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backGroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backGroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            backGroundView.heightAnchor.constraint(equalTo:scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: backGroundView.safeAreaLayoutGuide.topAnchor,constant: 96),
            logoImage.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 32),
            logoImage.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -32),
            logoImage.widthAnchor.constraint(equalToConstant: 280),
            logoImage.heightAnchor.constraint(equalToConstant: 72)
        ])
        
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(lessThanOrEqualTo: logoImage.bottomAnchor, constant: 64),
            textFieldsStackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 20),
            textFieldsStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -20)
        ])
        
       
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 56),
            signInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
       
        
        NSLayoutConstraint.activate([
            signButtonsStackViewLeading,
            signinInUpButtonsStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -20),
            signButtonsStackViewTop
            
        ])
    
        NSLayoutConstraint.activate([
            socialNetworkButtonsForLoginStackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 20),
            socialNetworkButtonsForLoginStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -20),
            socialNetworkButtonsForLoginStackView.topAnchor.constraint(equalTo: signinInUpButtonsStackView.bottomAnchor, constant: 32)
        ])
        
        
        NSLayoutConstraint.activate([
            appleLoginButton.topAnchor.constraint(lessThanOrEqualTo: signinInUpButtonsStackView.bottomAnchor, constant: 88),
            appleLoginButton.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 20),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 56),
            appleLoginButton.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            skipRegistrationButton.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -40),
            skipRegistrationButton.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 32),
            skipRegistrationButton.topAnchor.constraint(greaterThanOrEqualTo: appleLoginButton.bottomAnchor, constant: 48)
        ])
    }
}


