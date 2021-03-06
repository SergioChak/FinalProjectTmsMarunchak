////
////  SignupViewController.swift
////  ProjectFinalMarunchak
////
////  Created by Сергей Марунчак on 24.05.2022.
////
//
//
//import UIKit
//
//class SignupViewController: UIViewController {
//
//    private let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.isScrollEnabled = true
//        scrollView.isUserInteractionEnabled = true
//        return scrollView
//    }()
//    
//    private let backGroundView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    private let topLabel : UILabel = {
//        let topLabel = UILabel()
//        topLabel.text = "Welcome, Let's create a New account for You!"
//        topLabel.font.withSize(24)
//        topLabel.translatesAutoresizingMaskIntoConstraints = false
//        return topLabel
//    }()
//     
//    private let firstNameTextField: UITextField = {
//       let textField = UITextField()
//        textField.clearButtonMode = .whileEditing
//        textField.placeholder = "First Name"
//        textField.borderStyle = .roundedRect
//        textField.clearButtonMode = .whileEditing
//        textField.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        return textField
//    }()
//    
//    private let firstNameValidLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Required field"
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let secondNameTextField: UITextField = {
//        let textField = UITextField()
//        textField.clearButtonMode = .whileEditing
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "Second Name"
//        textField.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        return textField
//    }()
//    
//    
//    private let secondNameValidLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Required field"
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let ageValidLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Required field"
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
// 
//    private let phoneNumberTextField: UITextField = {
//       let textField = UITextField()
//        textField.clearButtonMode = .whileEditing
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "Your Phone Number"
//        textField.keyboardType = .phonePad
//        textField.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        return textField
//    }()
//    
//    private let phoneValidLabel: UILabel = {
//       let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.text = "Required field"
//        return label
//    }()
//    
//    private let emailTextField: UITextField = {
//       let textField = UITextField()
//        textField.clearButtonMode = .whileEditing
//        textField.placeholder = "E-mail..."
//        textField.borderStyle = .roundedRect
//        textField.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        return textField
//    }()
//    
//    private let emailValidLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Required field"
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let passwordTextField: UITextField = {
//       let textField = UITextField()
//        textField.clearButtonMode = .whileEditing
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "Create Password"
//        textField.isSecureTextEntry  = true
//        textField.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        return textField
//    }()
//    
//    private let passwordValidLabel: UILabel = {
//       let label  = UILabel()
//        label.text = "Required field"
//        label.numberOfLines = 0
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let signUpButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = .black
//        button.setTitle("SignUp", for: .normal)
//        button.tintColor = .white
//        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    
//    
//    
//    private var elementsStackView = UIStackView()
//    
//    private let datePicker = UIDatePicker()
//    
//    let nameValidType: String.ValidTypes = .name
//    let emailValidType: String.ValidTypes = .email
//    let passwordValidType: String.ValidTypes = .password
//    let phoneValidType: String.ValidTypes = .phone
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupViews()
//        setConstraints()
//        setupDelegate()
//        setupDatePicker()
//        registerKeyboardNotification()
//    }
//
//    deinit{
//        removeKeyboardNotification()
//    }
//    
//    private func setupViews(){
//        title = .none
//        self.navigationItem.backBarButtonItem?.image = UIImage(named: "arrow_back")
//        self.navigationItem.hidesBackButton = false
//        self.navigationItem.backBarButtonItem?.title = "Go to main screen"
//
//        
//        view.addSubview(scrollView)
//        scrollView.addSubview(backGroundView)
//        
//        elementsStackView = UIStackView(arrangedSubviews: [firstNameTextField,
//                                                            firstNameValidLabel,
//                                                           secondNameTextField,
//                                                           secondNameValidLabel,
//                                                           datePicker,
//                                                           ageValidLabel,
//                                                           phoneNumberTextField,
//                                                           phoneValidLabel,
//                                                           emailTextField,
//                                                           emailValidLabel,
//                                                           passwordTextField,
//                                                           passwordValidLabel],
//                                        axis: .vertical,
//                                        spacing: 10,
//                                        distribution: .fillEqually)
//        elementsStackView.alignment = .leading
//        
////        elementsStackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        
//        backGroundView.addSubview(elementsStackView)
//        backGroundView.addSubview(topLabel)
//        backGroundView.addSubview(signUpButton)
//    }
//    
//    private func setupDelegate(){
//        firstNameTextField.delegate = self
//        secondNameTextField.delegate = self
//        phoneNumberTextField.delegate = self
//        emailTextField.delegate = self
//        passwordTextField.delegate = self
//    }
//
//    private func setupDatePicker(){
//        datePicker.datePickerMode = .date
//        datePicker.backgroundColor = .white
//        datePicker.layer.borderColor = .init(red: 219, green: 491, blue: 013, alpha: 1)
//        datePicker.layer.borderWidth = 1
//        datePicker.clipsToBounds = true
//        datePicker.layer.cornerRadius = 12
//        datePicker.timeZone = .autoupdatingCurrent
//        datePicker.calendar = .autoupdatingCurrent
////        datePicker.largeContentTitle = "Your birth date"
//        datePicker.maximumDate = .now
////        datePicker.minimumDate = .distantPast.addingTimeInterval(TimeInterval.)
//        datePicker.preferredDatePickerStyle = .automatic
//        datePicker.translatesAutoresizingMaskIntoConstraints  = false
//        datePicker.tintColor = .black
//        
//    }
//
//    @objc private func signUpButtonDidTap(){
//        print("SignUp Completed!")
////MARK: пока оставляю такую навигацию модалки во весь экран, потом надо бэкбаттон добавить попробовать и сделать чтобы все прошлые экраны из стэка удалялись!
//        navigationController?.pushViewController(RegistrationFinishedViewController(), animated: true)
//    
//        topLabel.text = "Congratulations,your account's been created!"
//        
//    }
//    
//    private func setTextField(textfield: UITextField, label: UILabel,validType:String.ValidTypes, validMessage: String, wrongMessage: String, string:String, range: NSRange){
//        let text = (textfield.text ?? "") + string
//        let result: String
//        
//        if range.length == 1 {
//            let end = text.index(text.startIndex, offsetBy: text.count - 1)
//            result = String(text[text.startIndex..<end])
//        }else{
//            result = text
//        }
//            
//        textfield.text = result
//        
//        if result.isValid(validType: validType){
//            label.text = validMessage
//            label.textColor = .green
//        }else{
//            label.text = wrongMessage
//            label.textColor  = .red
//        }
//    }
//    
//    
//    private func ageIsValid() -> Bool {
//        let calendar = NSCalendar.current
//        let dateNow = Date()
//        let birthday = datePicker.date
//        
//        let age = calendar.dateComponents([.year], from: birthday, to: dateNow)
//        let ageYear = age.year
//        guard let ageUser = ageYear else { return false }
//        return {ageUser < 18 ? false : true }()
//        
//    }
//    
//}
////MARK: - textfield Delegates
//
//extension SignupViewController: UITextFieldDelegate{
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        switch textField {
//        case firstNameTextField: setTextField(textfield: firstNameTextField,
//                         label: firstNameValidLabel,
//                         validType: nameValidType,
//                         validMessage: "Name is Valid",
//                         wrongMessage: "Only A-Z characters, min 1 character!",
//                         string: string,
//                         range: range)
//        
//        case secondNameTextField: setTextField(textfield: secondNameTextField,
//                         label: secondNameValidLabel,
//                         validType: nameValidType,
//                         validMessage: "Name is Valid",
//                         wrongMessage: "Only A-Z characters, min 1 character!",
//                         string: string,
//                         range: range)
//        
//        case emailTextField: setTextField(textfield: emailTextField,
//                         label: emailValidLabel,
//                         validType: emailValidType,
//                         validMessage: "Email is Valid",
//                         wrongMessage: "Email is not valid!",
//                         string: string,
//                         range: range)
//            
//        case passwordTextField: setTextField(textfield: passwordTextField,
//                         label: passwordValidLabel,
//                         validType: passwordValidType,
//                         validMessage: "Password is Valid",
//                         wrongMessage: "Password is incorrect,min 1 character & 1 symbol,at least 6 symbols all!",
//                         string: string,
//                         range: range)
//            
//        case phoneNumberTextField: setTextField(textfield: phoneNumberTextField,
//                         label: phoneValidLabel,
//                         validType: phoneValidType,
//                         validMessage: "phone is Valid",
//                         wrongMessage: "phone is invalid & must be 12 numbers!",
//                         string: string,
//                         range: range)
//        
//        default:
//            break
//        }
//        return false
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        firstNameTextField.resignFirstResponder()
//        secondNameTextField.resignFirstResponder()
//        emailTextField.resignFirstResponder()
//        passwordTextField.resignFirstResponder()
//        return true
//    }
//}
//
////MARK: keyboard hides
//extension SignupViewController{
//    private func registerKeyboardNotification(){
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillShow),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
//        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillHide),
//                                               name: UIResponder.keyboardWillHideNotification,
//                                               object: nil)
//    }
//    
//    private func removeKeyboardNotification(){
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//
//    }
//    
//    
//    @objc private func keyboardWillShow(notification: Notification){
//        let userInfo = notification.userInfo
//        let keyBoardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        scrollView.contentOffset = CGPoint(x: 0, y: keyBoardHeight.height/2.6)
//    }
//    @objc private func keyboardWillHide(notification: Notification){
//        scrollView.contentOffset = CGPoint.zero
//    }
//}
//
//
////MARK: - Setting Constraints
// 
//extension SignupViewController{
//    
//    private func setConstraints(){
//        
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            backGroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            backGroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
//            backGroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            backGroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            elementsStackView.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor),
//            elementsStackView.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
//            elementsStackView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 20),
//            elementsStackView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -20),
//            elementsStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 16)
//        ])
//        
//        NSLayoutConstraint.activate([
//            topLabel.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor),
//            topLabel.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 20),
//            topLabel.topAnchor.constraint(equalTo: backGroundView.safeAreaLayoutGuide.topAnchor, constant: 10)
//        ])
//        
//        NSLayoutConstraint.activate([
//            signUpButton.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor),
//            signUpButton.topAnchor.constraint(equalTo: elementsStackView.bottomAnchor, constant: 16),
//      
//            signUpButton.heightAnchor.constraint(equalToConstant: 40),
//            signUpButton.widthAnchor.constraint(equalToConstant: 320)
//        ])
//    }
//}
//
